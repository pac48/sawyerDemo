FROM osrf/ros:noetic-desktop-full

SHELL ["/bin/bash", "-c"]

# clone source
ENV ROS_WS /home/sawyer_ws
RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS/src
RUN git clone git@github.com:pac48/sawyerDemo.git
#WORKDIR sawyerDemo
#RUN git checkout main
#RUN vcs import < external.repos.yaml
WORKDIR $ROS_WS

# get dependencies
RUN apt update
RUN rosdep update
RUN rosdep install --from-paths src --ignore-src -y

RUN cd ${ROS_WS} \
    && . /opt/ros/noetic/setup.sh \
    && catkin_make \
    && source ${ROS_WS}/devel/setup.bash

# copy entry pointer script
RUN apt install net-tools -y
RUN apt install tmux -y
RUN apt-get install iputils-ping -y
RUN adduser root dialout
COPY ros_entrypoint.sh /
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
