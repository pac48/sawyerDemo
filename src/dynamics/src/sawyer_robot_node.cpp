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

void simulateSawyer(Sawyer* sawyer, ros::Publisher &jointStatePub, sensor_msgs::JointState &jointStateMsg, double dt){
  //  sawyer->step(dt,100);
    auto q = sawyer->dynamics->getPosition();
    auto qd = sawyer->dynamics->getVelocity();
    if (qd[6] ==1.0)
        qd[6] = 0;
    //cout << qd << endl << endl;
    //qd *= .99;
    q += qd*dt;
    jointStateMsg = sensor_msgs::JointState();
    for (int i =0 ; i < q.size(); i++){
        jointStateMsg.position.push_back(q[i]);
        jointStateMsg.name.push_back(sawyer->jointNames[i]);
    }
    sawyer->dynamics->setPosition(q);
   // sawyer->dynamics->setVelocity(qd*0);
    sawyer->dynamics->forwardPosition();
    //sawyer->dynamics->forwardVelocity();
    jointStatePub.publish(jointStateMsg);
    
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "sawyer_node");
    ros::NodeHandle n;
    ROSProvider::init(&n);
    bool use_sim;
    n.param<bool>("/sawyer_node/use_simulation", use_sim, true);
    auto sawyer = RobotFactory::getRobot<Sawyer>();
    // update joints
    auto [jointRvizPub, jointRvizMsg] = ROSProvider::getPublisher<sensor_msgs::JointState>("rviz/joint_states");
    auto jointStateSubscriberrviz = ROSProvider::getSubscriber("/robot/joint_states", Sawyer::rvizUpdateJoints, "1");
    // operational position
    auto [operationalPosPub, operationalPosPubMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("/robot/operational_position");
    //auto operationalPosSubscriber = ROSProvider::getSubscriber("/robot/joint_states", Sawyer::updateOperationalPos, "2");
    // operational velocity
    auto [jointVelPub, jointVelPubMsg] = ROSProvider::getPublisher<intera_core_msgs::JointCommand>("/robot/limb/right/joint_command");
    auto operationalVelSubscriber = ROSProvider::getSubscriber("/robot/operational_vel", Sawyer::sendOpJointVelocities);
    auto  jointVelSub = ROSProvider::getSubscriber("/robot/limb/right/joint_command", Sawyer::updateVelJoints, "0");
    int rate = 100.0;
    double dt = 1.0/rate;
    ros::Rate loop_rate(rate);

    // simulated
    if (use_sim){
        auto [jointStatePub, jointStateMsg] = ROSProvider::getPublisher<sensor_msgs::JointState>("/robot/joint_states");
        sawyer->dynamics->setWorldGravity(0,0,0);
        while (ros::ok())
        {
            simulateSawyer(sawyer, jointStatePub, jointStateMsg, dt);
            ros::spinOnce();
            loop_rate.sleep();
        }

    } else{
    auto jointStateSubscriber = ROSProvider::getSubscriber("/robot/joint_states", Sawyer::updateJoints, "0");
        while (ros::ok())
        {
            ros::spinOnce();
        }

    }

    return 0;
}
