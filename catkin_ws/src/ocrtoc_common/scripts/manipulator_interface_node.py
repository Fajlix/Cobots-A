#!/usr/bin/env python3

import rospy
from ocrtoc_common.manipulator_interface import ManipulatorInterface

if __name__ == '__main__':
    rospy.init_node('manipulator_interface_node')
    m_i = ManipulatorInterface('ur10_arm')
    m_i.print_basic_info()
    rospy.spin()
