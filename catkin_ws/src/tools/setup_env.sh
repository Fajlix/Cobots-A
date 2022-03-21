# rebuild ocrtoc ros
cd /root/ocrtoc_ws/src/catkin_ws
rm -rf build devel
catkin_make -j 8
source /root/catkin_ws/devel/setup.bash
