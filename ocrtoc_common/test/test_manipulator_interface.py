#! /usr/bin/env python

import rospy
from ocrtoc_common.srv import *

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
    request = PoseGoalRequest()
    # Goal in 'world' frame
    request.goal.position.x = 0.7455162
    request.goal.position.y = 0.00037607225
    request.goal.position.z = 0.2
    request.goal.orientation.x = 0.14711579653281887
    request.goal.orientation.y = -0.9451756074466063
    request.goal.orientation.z = -0.04483923682934649
    request.goal.orientation.w = 0.288078906445812
    print('='*80)
    print(request.goal)
    rospy.wait_for_service('/send_pose_goal')
    try:
        service_call = rospy.ServiceProxy('/send_pose_goal', PoseGoal)
        response = service_call(request)
        print(response)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
    print()
    print()
