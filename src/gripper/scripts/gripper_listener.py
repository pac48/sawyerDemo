#!/usr/bin/env python

import rospy

from std_msgs.msg import Bool
from intera_core_msgs.msg import IOComponentCommand

pub = rospy.Publisher('/io/end_effector/right_gripper/command', IOComponentCommand, queue_size=3)

calibrate2 = '{"signals": {"calibrate": {"data": [true], "format": {"type": "bool"}}}}'
calibrate1 = '{"signals": {"dead_zone_m": {"data": [0.001], "format": {"type": "float"}}}}'
close = '{"signals": {"position_m": {"data": [0.0], "format": {"type": "float"}}}}'
open = '{"signals": {"position_m": {"data": [0.041667], "format": {"type": "float"}}}}'

def calibrate_gripper():
    command = IOComponentCommand()
    command.time = rospy.rostime.get_rostime()
    command.op = "set"
    command.args = calibrate1
    pub.publish(command)
    command.args = calibrate2
    pub.publish(command)

def callback(msg):
    command = IOComponentCommand()
    command.time = rospy.rostime.get_rostime()
    if msg.data:
        command.op = "set"
        command.args = open
    else:
        command.op = "set"
        command.args = close
    pub.publish(command)

if __name__ == '__main__':
    rospy.init_node('gripper_node')
    calibrate_gripper()
    rospy.Subscriber("/gripper_command", Bool, callback)
    rospy.spin()
