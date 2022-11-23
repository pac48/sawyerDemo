FROM osrf/ros:noetic-desktop-full

SHELL ["/bin/bash", "-c"]

# get apt packages
RUN apt update
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:roblib/ppa
RUN apt update
RUN apt-get install librl-dev -y

# clone source
RUN apt install git -y
ENV ROS_WS /home/sawyer_ws
RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS/src
RUN git clone https://github.com/pac48/sawyerDemo.git
WORKDIR sawyerDemo
RUN git checkout main
RUN apt install python3-vcstool
RUN vcs import < external.repos.yaml
WORKDIR $ROS_WS

# get dependencies
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
RUN ln -s /usr/bin/python3 /usr/bin/python

COPY ros_entrypoint.sh /
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
