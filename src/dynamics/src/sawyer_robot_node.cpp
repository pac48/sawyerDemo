//
// Created by paul on 7/26/19.
//
#include <iostream>
#include "std_msgs/Float32MultiArray.h"
#include "sensor_msgs/JointState.h"
#include "Sawyer.h"
#include "RobotFactory.h"
#include "ROSProvider.h"

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "real_robot_node");
    ros::NodeHandle n;
    ROSProvider::initialize(n);

    auto sawyer = RobotFactory::getRobot<Sawyer>();
    // update joints
    auto jointStateSubscriber = ROSProvider::getSubscriber("joint_states", 1, Sawyer::updateJoints);
    auto [jointRvizPub, jointRvizMsg] = ROSProvider::getPublisher<sensor_msgs::JointState>("rviz/joint_states", 1);
    auto jointStateSubscriberrviz = ROSProvider::getSubscriber("joint_states", 1, Sawyer::rvizUpdateJoints);
    // operational position
    auto [operationalPosPub, operationalPosPubMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("operational_position", 1);
    auto operationalPosSubscriber = ROSProvider::getSubscriber("operational_position", 1, Sawyer::updateOperationalPos);
    // operational velocity
    auto [jointVelPub, jointVelPubMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("joint_velocity_command", 1);
    auto operationalVelSubscriber = ROSProvider::getSubscriber("operational_vel", 1, Sawyer::sendOpJointVelocities);

    ros::Rate loop_rate(50);
    while (ros::ok())
    {
        ROSProvider::publishAll();
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
}
