cmake_minimum_required(VERSION 2.8.3)
project(dynamics)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
find_package(RL REQUIRED)
#find_package(catkin REQUIRED roscpp message_generation)
find_package(catkin REQUIRED COMPONENTS
        roscpp
        message_generation
        intera_core_msgs
        )

add_service_files(
        FILES
        getStaticTorques.srv
        setTorques.srv
)

generate_messages(
        DEPENDENCIES
        std_msgs
        intera_core_msgs
)


catkin_package(
        CATKIN_DEPENDS
        roscpp
        std_msgs
        message_runtime
        intera_core_msgs
)
include_directories(
        ${catkin_INCLUDE_DIRS}
        ${RL_INCLUDE_DIRS}
)

add_dependencies(${${PROJECT_NAME}_EXPORTED_TARGETS})
add_executable(sawyer_node src/sawyer_robot_node.cpp)

target_link_libraries(sawyer_node ${RL_LIBRARIES} ${catkin_LIBRARIES})
add_dependencies( sawyer_node ${${PROJECT_NAME}_EXPORTED_TARGETS})