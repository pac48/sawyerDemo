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

    Sawyer() : Robot("Sawyer")
    {
        // initialize a reasonable default
        auto q = this->dynamics->getPosition();
        q[0] = (0/ 180.0) * 3.14;
        q[1] = (-45/ 180.0) * 3.14;
        q[2] = (0 / 180.0) * 3.14;
        q[3] = (90/ 180.0) * 3.14;
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
            int ind = robot->jointNames2Ind[msg->name[i]];
            q[ind] = msg->position[i];
        }
        robot->dynamics->setPosition(q);
        robot->dynamics->forwardPosition();
        updateOperationalPos(msg);
    }

    static void updateVelJoints(const intera_core_msgs::JointCommand::ConstPtr &msg)
    { // set joints to new config from message
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        auto qd = robot->dynamics->getVelocity();
        for (int i = 0; i < msg->velocity.size(); i++)
        {
            int ind = robot->jointNames2Ind[msg->names[i]];
            qd[ind] = msg->velocity[i];
        }
        robot->dynamics->setVelocity(qd);
       // robot->dynamics->forwardVelocity();
    }

    static void updateOperationalPos(const sensor_msgs::JointState::ConstPtr &msg)
    { // set joints to new config from message
        auto [operationalPosPub, operationalPosPubMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("/robot/operational_position");
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        auto q = robot->dynamics->getPosition();
        for (int i = 0; i < msg->position.size(); i++)
        {
           int ind = robot->jointNames2Ind[msg->name[i]];
            q[ind] = msg->position[i];
        }
        robot->dynamics->setPosition(q);
        robot->dynamics->forwardPosition();
        operationalPosPubMsg.data = robot->getOperationalPosition(9); // still need to check 2 and 1;
        operationalPosPub.publish(operationalPosPubMsg);
    }


    static void rvizUpdateJoints(const sensor_msgs::JointState::ConstPtr &msg)
    { //maybe broken
        auto [jointRvizPub, jointRvizMsg] = ROSProvider::getPublisher<sensor_msgs::JointState>("rviz/joint_states");
        jointRvizMsg.position = msg->position;
        jointRvizMsg.name = msg->name;
        ROSProvider::setTimeStampNow(jointRvizMsg);
        jointRvizPub.publish(jointRvizMsg);
    }

    static void sendOpJointVelocities(const std_msgs::Float32MultiArray::ConstPtr &opVelMsg)
    { // send velocity commands given operational velocity command
        auto [jointVelPub, jointVelMsg] = ROSProvider::getPublisher<intera_core_msgs::JointCommand>("/robot/limb/right/joint_command");
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        std::vector<float> opvel;
        for (int i=0; i < opVelMsg->data.size(); i++)
            opvel.push_back(opVelMsg->data[i]);
        //robot->dynamics->inverseDynamics();
        auto qd = robot->xd2jd(9, robot->floatVec2MathVec(opvel));
        for (int i = 0; i < qd.size(); i++)
        {
            string name = robot->jointNames[i];
            if (name== "head_pan" || name == "right_gripper_l_finger_joint" || name == "right_gripper_r_finger_joint")
                continue;
            jointVelMsg.velocity.push_back(qd[i]);
            jointVelMsg.names.push_back(name);
        }
        jointVelMsg.mode = 2;
        //jointVelMsg.velocity. = robot->mathVec2FloatVec(robot->dynamics->getVelocity());
        ROSProvider::setTimeStampNow(jointVelMsg);
        jointVelPub.publish(jointVelMsg);
    }


};

#endif //YUMI_WS_YUMI_H
