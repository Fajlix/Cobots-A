#! /usr/bin/env python

import rospy
from tf.transformations import quaternion_from_euler
from ocrtoc_common.srv import *
import csv
import numpy as np

if __name__ == "__main__":
    print('='*80)
    rospy.wait_for_service('/get_manipulator_info')
    try:
        service_call = rospy.ServiceProxy('/get_manipulator_info', ManipulatorInfo)
        request = ManipulatorInfoRequest()
        response = service_call(request)
        print(response)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
    print()
    print()

    print('='*80)
    rospy.wait_for_service('/get_manipulator_state')
    try:
        service_call = rospy.ServiceProxy('/get_manipulator_state', ManipulatorState)
        request = ManipulatorStateRequest()
        response = service_call(request)
        print(response)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
    print()
    print()

    rospy.sleep(2.0)
    request = JointSpaceGoalRequest()
    with open("test_poses.csv") as file:
        reader = csv.reader(file, delimiter = ',')
        for row in reader:
            nprow = np.array(row)
            nprow = nprow.astype(np.float)
            request.joint_goal = nprow.tolist()
            print('='*80)
            #print(response.joint_position_list)
            print(request.joint_goal)
            rospy.wait_for_service('/send_joint_space_goal')
            try:
                service_call = rospy.ServiceProxy('/send_joint_space_goal', JointSpaceGoal)
                response = service_call(request)
                print(response)
            except rospy.ServiceException as e:
                print("Service call failed: %s"%e)
            rospy.sleep(2.0)
    print()
    print()
