#!/usr/bin/env python
# Aran Sena 2018
#
# Code example only, provided without guarantees
#
# Example for how to get both cameras streaming together
#
####
# Standard imports
import sys
import copy
import rospy
import moveit_commander
import time
from moveit_msgs.msg import PlanningScene, CollisionObject, ObjectColor
from octomap_msgs.msg import OctomapWithPose
from std_msgs.msg import ColorRGBA, Bool
from random import randint

from geometry_msgs.msg import Pose, Point, PointStamped

from shape_msgs.msg import SolidPrimitive

from visualization_msgs.msg import Marker

import tf

HOME= 0
MOVE_ABOVE_BLOCK = 1
MOVE_TO_BLOCK = 2
MOVE_ABOVE_BIN = 3
MOVE_TO_BIN = 4
state = HOME

from math import pi
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list


def callback_red_marker(msg):
    global state
    pose_goal = Pose()
    pose_goal.orientation.w = 0.0
    pose_goal.orientation.y = 1.0
    if state == MOVE_TO_BLOCK or  state == MOVE_ABOVE_BLOCK:
        tmp = PointStamped(point=msg.points[0],header=msg.header)
        p = listener.transformPoint("base", tmp)
        pose_goal.position = p.point
        pose_goal.position.z -= 0
        if pose_goal.position.x > 0:
            if state == MOVE_ABOVE_BLOCK:
                pose_goal.position.z = pose_goal.position.z + .2
            elif state == MOVE_TO_BLOCK:
                pose_goal.position.z = pose_goal.position.z
            plan = move_to_goal(pose_goal)
            if plan:
                if state == MOVE_TO_BLOCK:
                    gripper_pub.publish(Bool(data=False))
                else:
                    gripper_pub.publish(Bool(data=True))
                time.sleep(1)
            state += plan

    elif state == MOVE_TO_BIN or  state == MOVE_ABOVE_BIN:
        pose_goal.position.x = .4
        pose_goal.position.y = -.2
        if state==MOVE_ABOVE_BIN:
            pose_goal.position.z = .5
            pose_goal.position.y = .0
        elif state==MOVE_TO_BIN:
            pose_goal.position.z = .35
        plan = move_to_goal(pose_goal)
        if plan:
            if state == MOVE_TO_BIN:
                gripper_pub.publish(Bool(data=True))
            else:
                gripper_pub.publish(Bool(data=False))
            time.sleep(1)
        state = (state + plan) % (MOVE_TO_BIN + 1)
    elif state == HOME :
        gripper_pub.publish(Bool(data=True))
        time.sleep(1)
        state += 1


def move_to_goal(pose_goal):
    group.set_pose_target(pose_goal)
    group.set_max_velocity_scaling_factor(.2)
    group.set_planning_time(10)
    plan = group.go(wait=True)
    # Calling `stop()` ensures that there is no residual movement
    group.stop()
    # It is always good to clear your targets after planning with poses.
    # Note: there is no equivalent function for clear_joint_value_targets()
    group.clear_pose_targets()
    return plan


def add_box(position, scale, name):
    PS = PlanningScene()
    collision_object = CollisionObject()
    collision_object.header.frame_id = "base"
    collision_object.id = name
    solid_primitive = SolidPrimitive(type=1, dimensions=scale)
    collision_object.primitives.append(solid_primitive)

    collision_object.primitive_poses.append(Pose(position=Point(x=position[0], y=position[1], z=position[2])))

    PS.world.collision_objects.append(collision_object)

    PS.object_colors.append(ObjectColor(id=name, color=ColorRGBA(r=.1, b=.1, g=.1, a=1)))
    PS.is_diff = True
    PS.name = "box_scene"
    scene_pub.publish(PS)

if __name__ == '__main__':
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('move_group_python_interface_tutorial',
                    anonymous=True)
    scene_pub = rospy.Publisher("/planning_scene", PlanningScene, queue_size=3)
    gripper_pub = rospy.Publisher("/gripper_command", Bool, queue_size=3)
    rospy.sleep(1)

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    add_box([.5,.15, -.4], [.55, 1.1, 1.1], "box1")
    add_box([.3, .15, -.2], [.05, 1.1, 1.1], "box2")
    #rospy.sleep(1)

    listener = tf.TransformListener()
    listener.waitForTransform("/base", "/camera_color_optical_frame", rospy.Time(0), rospy.Duration(4.0))



    # box_pose = geometry_msgs.msg.PoseStamped()
    # box_pose.header.frame_id = "base"
    # box_pose.pose.orientation.w = 1.0
    # box_pose.pose.position.x = .8
    # box_pose.pose.position.y = .15
    # box_pose.pose.position.z = .55
    # box_name = "world"
    # rospy.sleep(1)
    # scene.add_box(box_name, box_pose, size=(1000*.55, 1000*.55, 1000*.55))
    # rospy.sleep(.1)
    group_name = "right_arm"
    group = moveit_commander.MoveGroupCommander(group_name)
    color=["/rviz_red_markers", "/rviz_green_markers" , "/rviz_blue_markers"]
    ind=randint(0,2)
    cor=color[ind]
    print(cor)
    rospy.Subscriber(cor, Marker, callback_red_marker)
    state = MOVE_ABOVE_BLOCK
    rospy.spin()


