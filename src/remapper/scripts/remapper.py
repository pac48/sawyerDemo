#!/usr/bin/env python 
# Aran Sena 2018
#
# Code example only, provided without guarantees
#
# Example for how to get both cameras streaming together
#
####
# Standard imports

import rospy
from sensor_msgs.msg import JointState


pub = rospy.Publisher("rviz/joint_states", JointState,queue_size=10)

def callback(msg):
    now = rospy.Time.now()
    msg.header.stamp.secs = now.secs
    msg.header.stamp.nsecs = now.nsecs
    pub.publish(msg)

if __name__ == '__main__':
    rospy.init_node('remapper_node')
    sub = rospy.Subscriber("/robot/joint_states", JointState, callback)
    rospy.spin()
