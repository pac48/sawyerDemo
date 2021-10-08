# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/share/orocos_kdl/cmake/../../../include;/usr/include/eigen3;/usr/include".split(';') if "${prefix}/include;/usr/share/orocos_kdl/cmake/../../../include;/usr/include/eigen3;/usr/include" != "" else []
PROJECT_CATKIN_DEPENDS = "kdl_parser;roscpp;rosconsole;rostime;sensor_msgs;tf2_ros;tf2_kdl".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lsawyer_state_publisher_solver;-ljoint_state_listener;-lorocos-kdl".split(';') if "-lsawyer_state_publisher_solver;-ljoint_state_listener;-lorocos-kdl" != "" else []
PROJECT_NAME = "sawyer_state_publisher"
PROJECT_SPACE_DIR = "/usr/local"
PROJECT_VERSION = "1.15.1"
