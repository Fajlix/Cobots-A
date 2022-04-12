#!/usr/bin/env python

import rospy
from ocrtoc_common.transform_interface import TransformInterface
from geometry_msgs.msg import PoseStamped, Quaternion

if __name__ == '__main__':
    rospy.init_node('test_transform_interface')
    transform_manager = TransformInterface()
    ros_trans = transform_manager.lookup_ros_transform('base_link', 'wrist_3_link')
    print('-'*80)
    print(ros_trans)
    print(type(ros_trans))

    numpy_trans = transform_manager.lookup_numpy_transform('base_link', 'wrist_3_link')
    print('-'*80)
    print(numpy_trans)
    print(type(numpy_trans))
    print(base_link_pose)
    base_link_pose.header.frame_id = "wrist_3_link"
    base_link_pose.pose.position.x = 1.0
    base_link_pose.pose.orientation.w = 1.0
    print('-'*80)
    print(base_link_pose)

    world_pose = transform_manager.do_transform_ros_posestamped(
        base_link_pose, ros_trans)
    print('-'*80)
    print(world_pose)
