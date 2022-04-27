To do:
* check so correct ros topics/services etc are started, to ensure that OCRTOC files works. (this could probably be done using launch files from myrg2ur10_moveit_config, just need to point them to correct driver)
* add gripper script from Ahmet (can be found on Teams)
* fix goal states in test_manipulator_interface.py to correct ones
* need to add "rosrun tf stac_transform_publisher 0 0 0 1.5707 0 0  world base_link 5" to launch files for real robot, otherwise world frame does not exist (as in ocrtoc_franka.launch and panda_control_moveit_rviz.launch in OCRTOC)
* add correct table measurements
* move ur10_cobotsA.xacro out of submodule

General:
* Clean up repo, remove unused folders/files, move drivers into drivers/ folder etc.

27-04:
created new file ur10_cobotsA.xacro to add links world and table to moveit config and created new moveit config
table loads in rviz so collisions are avoided

trajectory_execution.launch.xml: Comment out line 21 due to "WARN: unrecognized 'param' tag in <include> tag".

robot pos:
38.5 cm djup
50 cm bredd

robot bord:
77 cm djup
1 m bredd
76.5 cm höjd

bord:
130 cm bredd
65 cm djup
72 cm höjd

26-04:
changed manipulator name UR10_arm -> manipulator in moveit config
changed timeout limits in trajectory_execution.launch.xml
added missing step in readme
added home pose to realur10_moveit_config (robot arm 90 deg over the table, pose is slightly off.)

19-04:
Removed changes in Dockerfile as it is not used.

14-04:
Created MoveIt package realur10_moveit_config using MoveIt Setup Assistant

In MoveIt package realur10, added to ur10_moveit_planning_execution.launch:

```
  <node name="joint_state_publisher" pkg="joint_state_publisher" type="joint_state_publisher">
    <param name="/use_gui" value="false"/>
    <rosparam param="/source_list">[/joint_states]</rosparam>
  </node>

 <node name="manipulator_interface_node" pkg="ocrtoc_common" type="manipulator_interface_node.py" output="screen" />
```

Test script test_manipulator_interface.py works but goes to wrong coordinates.

13-04:
Extracted calibration info from UR10 robot, saved in file ur10_robot_calibration.yaml. Followed instructions on https://github.com/UniversalRobots/Universal_Robots_ROS_Driver

Installed driver in Docker inage, see readme for instructions.

file bringup_real_devices.launch changed line 14 to find new robot driver:

```
  <include file="$(find ur_bringup)/launch/ur10_bringup.launch" >
to
  <include file="$(find ur_robot_driver)/launch/ur10_bringup.launch" >
```

Control works using:

```
roslaunch ur_robot_driver ur10_bringup.launch robot_ip:=192.168.1.55
rosrun rqt_joint_trajectory_controller rqt_joint_trajectory_controller
```

12-04:
Created new branch, added Universal Robots ROS Driver package and fmauch_universal_robot as submodules. Followed instructions on https://github.com/UniversalRobots/Universal_Robots_ROS_Driver

removed folder "universal_robot" as is contains folders with same names -> Docker cannot create container. MoveIt launch file from planning_perception branch will probably need to be modified to point to correct files.