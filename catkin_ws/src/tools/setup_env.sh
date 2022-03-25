# rebuild ocrtoc ros
cd /root/catkin_ws
rm -rf build devel
catkin_make -j 8
source /root/catkin_ws/devel/setup.bash
