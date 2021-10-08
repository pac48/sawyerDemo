# Install script for directory: /home/paul/sawyerDemo/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE PROGRAM FILES "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE PROGRAM FILES "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/setup.bash;/usr/local/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES
    "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/setup.bash"
    "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/setup.sh;/usr/local/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES
    "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/setup.sh"
    "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/setup.zsh;/usr/local/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES
    "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/setup.zsh"
    "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES "/home/paul/sawyerDemo/src/cmake-build-debug/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/paul/sawyerDemo/src/cmake-build-debug/gtest/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/camera_tranform/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_common/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_sdk/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_tools_description/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/joint_state_publisher/joint_state_publisher_gui/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/realsense-ros/realsense2_description/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/sawyer_robot/sawyer_description/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/sawyer_moveit/sawyer_moveit/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/sawyer_robot/sawyer_robot/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/sns_ik/sns_ik/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/graph_msgs/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/joint_state_publisher/joint_state_publisher/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/realtime_tools/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_core_msgs/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/color_detector/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/dynamics/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/grab_blocks/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_motion_msgs/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/realsense-ros/realsense2_camera/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/camera_state_publisher/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/rviz_visual_tools/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/sawyer_moveit/sawyer_moveit_config/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/sawyer_state_publisher/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/sns_ik/sns_ik_lib/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/sns_ik/sns_ik_examples/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_examples/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/moveit_visual_tools/cmake_install.cmake")
  include("/home/paul/sawyerDemo/src/cmake-build-debug/urdf_geometry_parser/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/paul/sawyerDemo/src/cmake-build-debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
