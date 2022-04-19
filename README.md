# Cobots-A
Cobots-A for use on real UR10 robot arm.

## Installation
Pull OCRTOC docker image:

docker pull registry.cn-hangzhou.aliyuncs.com/ocrtoc2021/release:2.1

Create docker container:

bash tools/create_container.sh

Enter the docker container:

bash tools/exec_container.sh

### In the docker image:

cd /root/ocrtoc_ws/src/tools
bash setup_env.sh

Install the Universal Robots driver in Docker image:

cd /root/ocrtoc_ws/
rosdep install --from-paths src --ignore-src -y
catkin_make
source devel/setup.bash

## Control robot arm

roslaunch ocrtoc_task bringup_real_devices.launch

roslaunch realur10_moveit_config ur10_moveit_planning_execution.launch

roslaunch realur10_moveit_config moveit_rviz.launch rviz_config:=$(rospack find realur10_moveit_config)/launch/moveit.rviz

### For controllers to load, you need to stop and start the robot on the robot control board!

The real robot arm will follow Rviz motions. For scripts, 0 degrees is in front of robot as it is installed on the table in PSL.