# Install script for directory: /home/paul/sawyerDemo/src/intera_sdk/intera_interface

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
  include("/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/intera_interface" TYPE FILE FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/include/intera_interface/SawyerPositionJointTrajectoryActionServerConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/intera_interface" TYPE FILE FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/include/intera_interface/SawyerVelocityJointTrajectoryActionServerConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/intera_interface" TYPE FILE FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/include/intera_interface/SawyerPositionFFJointTrajectoryActionServerConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/paul/sawyerDemo/src/cmake-build-debug/devel/lib/python3/dist-packages/intera_interface/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/intera_interface" TYPE DIRECTORY FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/lib/python3/dist-packages/intera_interface/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/intera_interface.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_interface/cmake" TYPE FILE FILES
    "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/intera_interfaceConfig.cmake"
    "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/intera_interfaceConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_interface" TYPE FILE FILES "/home/paul/sawyerDemo/src/intera_sdk/intera_interface/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/intera_interface" TYPE PROGRAM FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/home_joints.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/intera_interface" TYPE PROGRAM FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/joint_trajectory_action_server.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/intera_interface" TYPE PROGRAM FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/calibrate_arm.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/intera_interface" TYPE PROGRAM FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/io_config_editor.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/intera_interface" TYPE PROGRAM FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/send_urdf_fragment.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/intera_interface" TYPE PROGRAM FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_sdk/intera_interface/catkin_generated/installspace/enable_robot.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/intera_interface" TYPE DIRECTORY FILES "/home/paul/sawyerDemo/src/intera_sdk/intera_interface/scripts/" USE_SOURCE_PERMISSIONS)
endif()

