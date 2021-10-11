cmake_minimum_required(VERSION 2.8.3)
project(gripper)

find_package(catkin
  REQUIRED
  COMPONENTS
  rospy
  sensor_msgs
  std_msgs
  intera_core_msgs
  visualization_msgs
)



catkin_package(
  CATKIN_DEPENDS
  rospy
  sensor_msgs
  std_msgs
  intera_core_msgs
  visualization_msgs
)

install(
  DIRECTORY scripts/
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  USE_SOURCE_PERMISSIONS
)
