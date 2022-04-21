To do:
* check so correct ros topics/services etc are started, to ensure that OCRTOC files works. (this could probably be done using launch files from myrg2ur10_moveit_config, just need to point them to correct driver)
* add gripper script from Ahmet (can be found on Teams)

* Clean up repo, remove unused folders/files, move drivers into drivers/ folder etc.

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