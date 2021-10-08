//
// Created by paul on 1/7/20.
//
#ifndef SAWYER_H
#define SAWYER_H

#include "Robot.cpp"
#include "ROSProvider.h"

class Sawyer : public Robot
{
    
public:
    std::vector<int> joint2RL = {1, 8, 9, 0, 2, 3, 4, 5, 6, 7}; // maps joint sensor to robot library
    std::vector<int> RL2Joint = {3, 0, 4, 5, 6, 7, 8, 9, 2, 1};
            std::vector<std::string> jointNames = {
            "head_pan",
            "right_gripper_l_finger_joint",
            "right_gripper_r_finger_joint",
            "right_j0",
            "right_j1",
            "right_j2",
            "right_j3",
            "right_j4",
            "right_j5",
            "right_j6"};

    Sawyer() : Robot("Sawyer")
    {
        // initialize a reasonable default
        auto q = this->dynamics->getPosition();
        q[0] = (0/ 180.0) * 3.14;
        q[1] = (0/ 180.0) * 3.14;
        q[2] = (0 / 180.0) * 3.14;
        q[3] = (0/ 180.0) * 3.14;
        q[4] = (0/ 180.0) * 3.14;
        q[5] = (0/ 180.0) * 3.14;
        q[6] = (0 / 180.0) * 3.14;
        this->dynamics->setPosition(q);
    }

    static void updateJoints(const sensor_msgs::JointState::ConstPtr &msg)
    { // set joints to new config from message
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        auto q = robot->dynamics->getPosition();
        for (int i = 0; i < msg->position.size(); i++)
        {
            q[robot->joint2RL[i]] = msg->position[i];
        }
        robot->dynamics->setPosition(q);
        robot->dynamics->forwardPosition();
    }

    static void updateOperationalPos(const sensor_msgs::JointState::ConstPtr &msg)
    { // set joints to new config from message
        auto [operationalPosPub, operationalPosPubMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("/robot/operational_position");
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        auto q = robot->dynamics->getPosition();
        for (int i = 0; i < msg->position.size(); i++)
        {
            q[robot->joint2RL[i]] = msg->position[i];
        }
        auto tmp = robot->dynamics->getPosition();

        robot->dynamics->setPosition(q);
        robot->dynamics->forwardPosition();
        operationalPosPubMsg.data = robot->getOperationalPosition(9); // still need to check 2 and 1;
        operationalPosPub.publish(operationalPosPubMsg);

    }


    static void rvizUpdateJoints(const sensor_msgs::JointState::ConstPtr &msg)
    { //maybe broken
        auto [jointRvizPub, jointRvizMsg] = ROSProvider::getPublisher<sensor_msgs::JointState>("/joint_states");
        msg->header.stamp.setNow(ros::Time::now());
        jointRvizPub.publish(msg);
    }

    static void sendOpJointVelocities(const std_msgs::Float32MultiArray::ConstPtr &opVelMsg)
    { // send velocity commands given operational velocity command
        auto [jointVelPub, jointVelMsg] = ROSProvider::getPublisher<intera_core_msgs::JointCommand>("/robot/limb/right/joint_command");
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        std::vector<float> opvel;
        for (int i = 0; i < 6; i++)
        {
            opvel.push_back(opVelMsg->data[i]);
        }
        //robot->dynamics->inverseDynamics();
        auto qd = robot->xd2jd(9, robot->floatVec2MathVec(opvel));
        for (int i = 0; i < robot->RL2Joint.size(); i++)
        {
            if (robot->RL2Joint[i] < 3)
                continue;
            jointVelMsg.velocity.push_back(qd[robot->RL2Joint[i]]);
            jointVelMsg.names.push_back(robot->jointNames[robot->RL2Joint[i]]);
        }
        jointVelMsg.mode = 2;
        //jointVelMsg.velocity. = robot->mathVec2FloatVec(robot->dynamics->getVelocity());
        jointVelPub.publish(jointVelMsg);
    }


};

#endif //YUMI_WS_YUMI_H
