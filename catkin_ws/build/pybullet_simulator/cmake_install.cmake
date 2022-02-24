# Install script for directory: /home/x/Cobots-A/catkin_ws/src/pybullet_simulator

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/x/Cobots-A/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/x/Cobots-A/catkin_ws/build/pybullet_simulator/catkin_generated/installspace/pybullet_simulator.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pybullet_simulator/cmake" TYPE FILE FILES
    "/home/x/Cobots-A/catkin_ws/build/pybullet_simulator/catkin_generated/installspace/pybullet_simulatorConfig.cmake"
    "/home/x/Cobots-A/catkin_ws/build/pybullet_simulator/catkin_generated/installspace/pybullet_simulatorConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pybullet_simulator" TYPE FILE FILES "/home/x/Cobots-A/catkin_ws/src/pybullet_simulator/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pybullet_simulator" TYPE DIRECTORY FILES
    "/home/x/Cobots-A/catkin_ws/src/pybullet_simulator/config"
    "/home/x/Cobots-A/catkin_ws/src/pybullet_simulator/launch"
    "/home/x/Cobots-A/catkin_ws/src/pybullet_simulator/robots"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pybullet_simulator" TYPE PROGRAM FILES
    "/home/x/Cobots-A/catkin_ws/src/pybullet_simulator/scripts/load_env_ros.py"
    "/home/x/Cobots-A/catkin_ws/src/pybullet_simulator/scripts/pybullet_env.py"
    "/home/x/Cobots-A/catkin_ws/src/pybullet_simulator/scripts/ros_interface.py"
    )
endif()

