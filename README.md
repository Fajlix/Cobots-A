# Cobots-A
Cobots-A for use on real UR10 robot arm.

## Installation
Pull OCRTOC docker image:

```
docker pull registry.cn-hangzhou.aliyuncs.com/ocrtoc2021/release:2.1
```

Create docker container:

```
bash tools/create_container.sh
```

Enter the docker container:

```
bash tools/exec_container.sh
```

### In the docker image:

Install the Universal Robots driver in Docker image:

```
sudo apt update -qq
rosdep install --from-paths src/Universal_Robots_ROS_Driver --ignore-src -y
cd /root/ocrtoc_ws/src/tools
bash setup_env.sh
```

## Control robot arm
run each command in a new terminal window


```
roslaunch ocrtoc_task bringup_real_devices.launch #The realsense camera will give some errors, it's fine.

roslaunch ocrtoc_perception perception_solution.launch

roslaunch ocrtoc_planning planning_solution.launch 

roslaunch realcobotsA_moveit_config ur10_moveit_planning_execution.launch 

rosrun tf static_transform_publisher 0 0 0 1.5707 0 0  world base_link 5

rosrun tf static_transform_publisher 0 0 0 0 0 0  camera_link realsense_link 5

roslaunch ocrtoc_task trigger.launch 

```

### For controllers to load, you need to stop and start the robot on the robot control board!

The real robot arm will follow Rviz motions.