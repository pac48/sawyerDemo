# Install script for directory: /home/paul/sawyerDemo/src/intera_common/intera_motion_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_motion_msgs/msg" TYPE FILE FILES
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/EndpointTrackingError.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/InterpolatedPath.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/JointTrackingError.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/MotionStatus.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/TrackingOptions.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/Trajectory.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/TrajectoryAnalysis.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/TrajectoryOptions.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/Waypoint.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/WaypointOptions.msg"
    "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/msg/WaypointSimple.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_motion_msgs/action" TYPE FILE FILES "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/action/MotionCommand.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_motion_msgs/msg" TYPE FILE FILES
    "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/intera_motion_msgs/msg/MotionCommandAction.msg"
    "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/intera_motion_msgs/msg/MotionCommandActionGoal.msg"
    "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/intera_motion_msgs/msg/MotionCommandActionResult.msg"
    "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/intera_motion_msgs/msg/MotionCommandActionFeedback.msg"
    "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/intera_motion_msgs/msg/MotionCommandGoal.msg"
    "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/intera_motion_msgs/msg/MotionCommandResult.msg"
    "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/intera_motion_msgs/msg/MotionCommandFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_motion_msgs/cmake" TYPE FILE FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_motion_msgs/catkin_generated/installspace/intera_motion_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/include/intera_motion_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/roseus/ros/intera_motion_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/common-lisp/ros/intera_motion_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/share/gennodejs/ros/intera_motion_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/paul/sawyerDemo/src/cmake-build-debug/devel/lib/python3/dist-packages/intera_motion_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/paul/sawyerDemo/src/cmake-build-debug/devel/lib/python3/dist-packages/intera_motion_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_motion_msgs/catkin_generated/installspace/intera_motion_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_motion_msgs/cmake" TYPE FILE FILES "/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_motion_msgs/catkin_generated/installspace/intera_motion_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_motion_msgs/cmake" TYPE FILE FILES
    "/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_motion_msgs/catkin_generated/installspace/intera_motion_msgsConfig.cmake"
    "/home/paul/sawyerDemo/src/cmake-build-debug/intera_common/intera_motion_msgs/catkin_generated/installspace/intera_motion_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/intera_motion_msgs" TYPE FILE FILES "/home/paul/sawyerDemo/src/intera_common/intera_motion_msgs/package.xml")
endif()

