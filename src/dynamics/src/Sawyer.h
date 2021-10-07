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
    std::vector<std::string> jointNames = {"sawyer_joint_1"
                                           "sawyer_joint_7",
                                           "sawyer_joint_4",
                                           "sawyer_joint_6",
                                           "sawyer_joint_2",
                                           "sawyer_joint_3",
                                           "sawyer_joint_5"};
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

    static void updateJoints(const std_msgs::Float32MultiArray::ConstPtr &msg)
    { // set joints to new config from message
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        std::vector<float> data = msg->data;
        auto q = robot->floatVec2MathVec(data);
        for (int i = 0; i < data.size(); i++)
        {
            q[i] = data[i];
        }
        robot->dynamics->setPosition(q);
        robot->dynamics->forwardPosition();
    }

    static void updateOperationalPos(const std_msgs::Float32MultiArray::ConstPtr &msg)
    { // set joints to new config from message
        auto [operationalPosPub, operationalPosPubMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("operational_position", 1);
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        std::vector<float> data = msg->data;
        auto q = robot->floatVec2MathVec(data);
        for (int i = 0; i < data.size(); i++)
        {
            q[i] = data[i];
        }
        robot->dynamics->setPosition(q);
        robot->dynamics->forwardPosition();
        operationalPosPubMsg.data = robot->getOperationalPosition(0);
        operationalPosPub.publish(operationalPosPubMsg);

    }

    static void rvizUpdateJoints(const std_msgs::Float32MultiArray::ConstPtr &msg)
    { //maybe broken
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        std::vector<double> tmp;
        for (int i = 0; i < msg->data.size(); i++)
        {
            double val = msg->data[i];
            tmp.push_back(val);
        }
        //rvizMsgs->position = tmp;
  // rvizMsgs->name = robot->jointNames;
     //   rvizMsgs->header.stamp = ros::Time::now();
    }

    static void sendOpJointVelocities(const std_msgs::Float32MultiArray::ConstPtr &opVelMsg)
    { // send velocity commands given operational velocity command
        auto [jointVelPub, jointVelMsg] = ROSProvider::getPublisher<std_msgs::Float32MultiArray>("joint_velocity_command", 1);
        Sawyer* robot = RobotFactory::getRobot<Sawyer>();
        std::vector<float> opvel;
        for (int i = 0; i < 6; i++)
        {
            opvel.push_back(opVelMsg->data[i]);
        }
        robot->dynamics->setOperationalVelocity(0, robot->floatVec2MathVec(opvel));
        robot->dynamics->forwardVelocity();
        jointVelMsg.data = robot->mathVec2FloatVec(robot->dynamics->getVelocity());
        jointVelPub.publish(jointVelMsg);
    }


};

#endif //YUMI_WS_YUMI_H
