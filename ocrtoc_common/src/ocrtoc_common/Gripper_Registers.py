

import numpy as np
import pandas as pd
from pymodbus.client.sync import ModbusTcpClient as ModbusClient
from pymodbus.constants import Endian
from pymodbus.payload import BinaryPayloadDecoder
import concurrent.futures

import numpy as np

import time
import csv

from threading import Lock   # threading is used to run parallel processes
from threading import Thread 

import copy

def validator_int16(instance):
    if not instance.isError():
        '''.isError() implemented in pymodbus 1.4.0 and above.'''
        decoder = BinaryPayloadDecoder.fromRegisters(
            instance.registers,
            byteorder=Endian.Big, wordorder=Endian.Little
        )
        return float('{0:.2f}'.format(decoder.decode_16bit_int()))

    else:
        # Error handling.
        print("Error: Connection to the registers could not be established.")
        return None

#------------------------------------------------------------------------------------------------------------------#
# Get all the sensor readings (6 values) and combine them into a state vector x:

def getFt(): #get the tangential force values 
    global client
    FxR = abs(validator_int16(client.read_holding_registers(268, 1, unit=65)))/10 #divide by 10 for conversion from sensor units to usable units
    FyR = abs(validator_int16(client.read_holding_registers(269, 1, unit=65)))/10

    FxL = abs(validator_int16(client.read_holding_registers(259, 1, unit=65)))/10
    FyL = abs(validator_int16(client.read_holding_registers(260, 1, unit=65)))/10

    FtR = np.sqrt(FxR**2 + FyR**2) #computing the value from right and left sensors
    FtL = np.sqrt(FxL**2 + FyL**2) ##computing the value from right and left sensors

    Ft = (FtR+FtL)/2

    return (Ft+0.05)  #calibration parameter


def getFn():  #get the normal force
    global client
    FnR = abs(validator_int16(client.read_holding_registers(270, 1, unit=65)))/10
    FnL = abs(validator_int16(client.read_holding_registers(261, 1, unit=65)))/10

    Fn = (FnR+FnL)/2  #combine the right and left sensor readings

    return (abs(Fn)) 

def getTz(): #get the torque
 
    TzR = abs(validator_int16(client.read_holding_registers(273, 1, unit=65)))/10
    TzL = abs(validator_int16(client.read_holding_registers(264, 1, unit=65)))/10
    Tz = (TzR+TzL)/2 #combine the right and left sensor readings

    return (Tz+0.05)  #calibration parameter


# Get current width

def getCurrentWidth():  #get the width of the gripper
    global client

    current_width = (validator_int16(client.read_holding_registers(280, 1, unit=65)))

    return (current_width/10)  # divide by 10 to convert values from griper software to usable units

#------------------------------------------------------------------------------------------------------------------#
# Operate gripper with desired width and force
def operate_gripper(grip_width_mm, grip_force_N):  #arguements- griper width and gripper force
    global client

    # 1 wait for gripper to not be busy
    mutex1.acquire()
    isBusy = client.read_holding_registers(281, 1, unit=65)
    mutex1.release()
    while isBusy == 1:  #keeping running this while loop until the gripper becomes free
        mutex1.acquire()
        isBusy = client.read_holding_registers(281, 1, unit=65)
        mutex1.release()

    # 2 set target width and force in registers, multiply with ten to convert it to data that the gripper understands
    mutex1.acquire()
    client.write_register(3, int(grip_width_mm*10), unit=65)
    client.write_register(2, int(grip_force_N*10), unit=65)
    # 3 execute gripper command
    client.write_register(4, 1, unit=65)
    mutex1.release()
    # Save the force passed


    # 4 wait for gripper to not be busy
    mutex1.acquire()
    isBusy = client.read_holding_registers(281, 1, unit=65)
    mutex1.release()
    while isBusy == 1: #keeping running this while loop until the gripper becomes free *****why?
        mutex1.acquire()
        isBusy = client.read_holding_registers(281, 1, unit=65)
        mutex1.release()

    return True

def init():
    global mutex1
    mutex1 = Lock()
    box_ip = "192.168.1.1"  # OnRobot computebox IP address
    print("WOOOOOOOOPPP")
    global client
    client = ModbusClient(box_ip, port=502)  # Creates a client in this program that uses the box ip and port 502 (as per standard for modbus)
    return_val = client.connect()  # Tries to connect to the computebox
    print("Established connection to compute box?: ", return_val)  # prints in console if a connection is established
    if return_val:
        # init publishers
        print("Connection established")
    else:
        print("Catastrophic error please check yo self!!")


if __name__ == '__main__':
    init()