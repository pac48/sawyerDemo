//
// Created by paul on 7/26/19.
//
#include <iostream>
#include "std_msgs/Float32MultiArray.h"
#include "intera_core_msgs/JointCommand.h"
#include "sensor_msgs/JointState.h"
#include "Sawyer.h"
#include "RobotFactory.h"
#include "ROSProvider.h"

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "sawyer_node");
    ros::NodeHandle n;
    ROSProvider::init(&n);

    auto sawyer = RobotFactory::getRobot<Sawyer>();
    // update joints
    auto jointStateSubscriber = ROSProvider::getSubscriber("/robot/joint_states", Sawyer::updateJoints, "0");
    auto [jointRvizPub, jointRvizMsg] = ROSProvider::getPublisher<sensor_msgs::JointState>("/rviz/joint_states");
    auto jointStateSubscriberrviz = ROSProvider::getSubscriber("/robot/joint_states", Sawyer::rvizUpdateJoints, "1");
    // operational position
    auto [operationalPosPub, operationalPosPubMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("/robot/operational_position");
    auto operationalPosSubscriber = ROSProvider::getSubscriber("/robot/joint_states", Sawyer::updateOperationalPos, "2");
    // operational velocity
    auto [jointVelPub, jointVelPubMsg] = ROSProvider::getPublisher<inter>("/robot/limb/right/joint_command");
    auto operationalVelSubscriber = ROSProvider::getSubscriber("/robot/operational_vel", Sawyer::sendOpJointVelocities);

    ros::Rate loop_rate(50);
    while (ros::ok())
    {
       // ROSProvider::publishAll();
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
}
