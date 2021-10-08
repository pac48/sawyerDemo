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
    auto [jointRvizPub, jointRvizMsg] = ROSProvider::getPublisher<sensor_msgs::JointState>("/joint_states");
    auto jointStateSubscriberrviz = ROSProvider::getSubscriber("/robot/joint_states", Sawyer::rvizUpdateJoints, "1");
    // operational position
    auto [operationalPosPub, operationalPosPubMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("/robot/operational_position");
    auto operationalPosSubscriber = ROSProvider::getSubscriber("/robot/joint_states", Sawyer::updateOperationalPos, "2");
    // operational velocity
    auto [jointVelPub, jointVelPubMsg] = ROSProvider::getPublisher<intera_core_msgs::JointCommand>("/robot/limb/right/joint_command");
    auto operationalVelSubscriber = ROSProvider::getSubscriber("/robot/operational_vel", Sawyer::sendOpJointVelocities);
    // simulated
    auto [jointStatePub, jointStateMsg] = ROSProvider::getPublisher<sensor_msgs::JointState>("/robot/joint_states");


    ros::Rate loop_rate(50);
    sawyer->dynamics->setWorldGravity(0,0,-1);
    while (ros::ok())
    {
        auto qd = sawyer->getVelocity();
        qd[0] = .2;
        sawyer->step(.1,100);
        jointStateMsg = sensor_msgs::JointState();
        auto q = sawyer->getPosition();
        for (int i =0 ; i < q.size(); i++){
            jointStateMsg.position.push_back(q.at(sawyer->RL2Joint[i]));
            jointStateMsg.name.push_back(sawyer->jointNames.at(i));
        }

        jointStatePub.publish(jointStateMsg);
       // ROSProvider::publishAll();
        ros::spinOnce();
        loop_rate.sleep();

    }
    return 0;
}
