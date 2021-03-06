#!/usr/bin/env python
# Aran Sena 2018
#
# Code example only, provided without guarantees
#
# Example for how to get both cameras streaming together
#
####
# Standard imports
# import cv2
import rospy
import numpy as np
from numpy import matlib
from matplotlib import pyplot as plt

from sensor_msgs.msg import PointCloud2
from sensor_msgs.msg import Image
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point


mkr_pub_red = rospy.Publisher('/rviz_red_markers', Marker, queue_size = 1)
mkr_pub_green = rospy.Publisher('/rviz_green_markers', Marker, queue_size = 1)
mkr_pub_blue = rospy.Publisher('/rviz_blue_markers', Marker, queue_size = 1)

thresholds = [120, 150, 70]

im_msg = []

def get_saturation(im):
    height, width, channels = im.shape
    S = np.zeros((height,width,2))
    theta = 2*(30.0/180.0)*np.pi
    for c in range(0,3):
        theta -= 2*(60.0/180.0)*np.pi
        tmpx = np.cos(theta)*np.ones((height, width))
        tmpy = np.sin(theta)*np.ones((height, width))
        S[:, :, 0] += tmpx * im[:, :, c]
        S[:, :, 1] += tmpy * im[:, :, c]
    S = np.sum(np.abs(S), axis=2)
   # plt.imshow(S, interpolation='nearest', cmap='gray')
    #plt.show()
    return S


def getPoint(im, color_ind):
    # S = get_saturation(im)
    im = np.array(im, dtype=np.float64)
    color = im[:, :, color_ind]/(1 + np.sum(im, axis=2))#/(im[:, :, (color_ind + 1) % 3]  + im[:, :, (color_ind + 2) % 3])
    # color = color+.5*S
    # color = im[:, :, color_ind]
    color = 255*color
    #color[color > 255] = 255
    height, width = color.shape
    print(color_ind)
    print(np.max(color))    
    th = thresholds[color_ind]
    color_inds = color > th
    if not np.any(color_inds):
        return -1, -1
    tmp = (np.matmul(color_inds, np.linspace(0, width-1, width))) / (np.sum(color_inds, axis=1) + 0.00001)
    if not np.any(tmp > 1):
        return -1, -1

    pxi = int(np.median(tmp[tmp > 1]))
    #red_inds_T = np.transpose(red_inds)
    tmp[tmp > 0] = 1
    tmpy = tmp*np.linspace(0, height-1, height)
    tmpy = tmpy*(np.sum(color_inds, axis=1) > 3)
    #tmp = (np.matmul(red_inds_T, np.linspace(1, 480, 480))) / (np.sum(red_inds_T, axis=1) + 0.00001)
    pyi = int(np.min(tmpy[tmpy > 1])) + 15
    if False:
        plt.imshow(color_inds, interpolation='nearest', cmap='gray')
        plt.title(str(color_ind))
        plt.show()
        plt.imshow(color, interpolation='nearest', cmap='gray')
        plt.title(str(color_ind))
        plt.show()

    return pxi, pyi

#
# def callback_color(msg):
#     global im_msg
#     im_msg = msg



    # plt.imshow(im, interpolation='nearest')
    # plt.show()
    # i = 0 + 1

def callback(msg):

    # im = np.zeros((msg.height, msg.width, 3), dtype=np.uint8)
    # XYZ = np.zeros((msg.height, msg.width, 3), dtype=np.float32)
    b = bytearray()
    b.extend(msg.data)
    # ind = 0
    # offset = 4 # all types, int and float are 4 bytes
    floats = np.frombuffer(b, dtype=np.float32)
    uint8s = np.frombuffer(b, dtype=np.uint8)
    floats = np.reshape(floats, (-1,4))
    XYZ = floats[:,0:3]
    XYZ = np.reshape(XYZ, (msg.height, msg.width, 3))

    uint8s = np.reshape(uint8s, (-1, 4*4))

    im = uint8s[:, -4:-1]

    im = np.reshape(im, (msg.height, msg.width, 3))
    b = im[:, :, 0]
    g = im[:, :, 1]
    r = im[:, :, 2]
    im = np.dstack([r,g,b])

    #
    # for h in np.arange(msg.height):
    #     for w in np.arange(msg.width):
    #         for point_field in msg.fields:
    #             if point_field.name == 'x':
    #                 XYZ[h, w, 0] = (np.frombuffer(b[ind:ind+offset], dtype=np.float32))
    #             if point_field.name == 'y':
    #                 XYZ[h, w, 1] = (np.frombuffer(b[ind:ind+offset], dtype=np.float32))
    #             if point_field.name == 'z':
    #                 XYZ[h, w, 2] = (np.frombuffer(b[ind:ind+offset], dtype=np.float32))
    #
    #             if point_field.name == 'rgb':
    #                 rgb = (np.frombuffer(b[ind:ind+offset], dtype=np.uint8))
    #                 im[h, w, 0] = rgb[2]
    #                 im[h, w, 1] = rgb[1]
    #                 im[h, w, 2] = rgb[0]
    #
    #             ind = ind + offset
    #         # print("XYZ is : "+ str(XYZ[h, w, 0]) + ", " +  str(XYZ[h, w, 1]) + ", " + str(XYZ[h, w, 2]) )

    # plt.imshow(im)
    # plt.title("test")
    # plt.show()

    for c in range(1,2):
        pxi, pyi = getPoint(im, c)
        # xyz = XYZ[pyi, pxi, :]
        point = Point(XYZ[pyi, pxi, 0], XYZ[pyi, pxi, 1] , XYZ[pyi, pxi, 2])
        if np.isnan(XYZ[pyi, pxi, 0]) or  np.isnan(XYZ[pyi, pxi, 1]) or np.isnan(XYZ[pyi, pxi, 2]):
            continue
        publishRViZMarker(point, c)



    # b = bytearray()
    # b.extend(im_msg.data)
    # data = np.array(b, dtype=np.float32)
    # im = np.reshape(data, (im_msg.height, im_msg.width, 4))
    #
    #
    # b = bytearray()
    # b.extend(msg.data)
    # # bb = np.frombuffer(b, dtype=np.uint32)
    # data = np.frombuffer(b, dtype=np.float32)
    # depth = np.reshape(data, (msg.height, msg.width))
    # height, width = depth.shape
    #
    #
    # for c in range(0, 3):
    #     pxi, pyi = getPoint(im, c)
    #     if pxi == -1:
    #         continue
    #     d = depth[pyi, pxi]
    #     if d < 0.05:
    #         continue
    #     if np.isnan(d):
    #         continue
    #     AR_x = 1.2*69.4 / width
    #     AR_y = 42.5 / height
    #     # AR_x = 91.2/480
    #     # AR_y = 65.5/640
    #     a_x = (pxi - width / 2.0) * AR_x
    #     a_x = a_x * (np.pi / 180.0)
    #     x_pos = d * np.sin(a_x)
    #     z_pos = d * np.cos(a_x)
    #     a_y = (pyi - height/ 2.0) * AR_y
    #     a_y = a_y * (np.pi / 180.0)
    #     y_pos = d * np.sin(a_y)
    #     point = Point(x_pos, y_pos , z_pos)
    #     publishRViZMarker(point, c)

def publishRViZMarker(point, color_ind):
    """ Publishes a LINE marker that can be visualizaed in RViZ.
    This implementation takes geometry_msg/Point variables for the
    start_pos and goal_pos"""
    mkr = Marker()
    mkr.header.frame_id = "zed_left_camera_frame"
    mkr.action = mkr.ADD
    mkr.type = mkr.LINE_LIST
    mkr.scale.x = 0.03
    mkr.points.append(point)
    point2 = Point(point.x,point.y,point.z+0.01)
    mkr.points.append(point2)

    mkr.color.a = 1.0
    mkr.color.r = 0.
    mkr.color.g = 0.0
    mkr.color.b = 0.0

    if (color_ind == 0):
        mkr.color.r = 1.0
        mkr_pub_red.publish(mkr)
    elif(color_ind == 1):
        mkr.color.g = 1.0
        mkr_pub_green.publish(mkr)
    elif (color_ind == 2):
        mkr.color.b = 1.0
        mkr_pub_blue.publish(mkr)


if __name__ == '__main__':
    rospy.init_node('color_detector_node')
    rospy.Subscriber("/zed/zed_nodelet/point_cloud/cloud_registered", PointCloud2, callback)
    rospy.spin()
