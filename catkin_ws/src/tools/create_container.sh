sudo docker rm -f ocrtoc

sudo docker run -i -d --gpus all --name ocrtoc --network host \
        --privileged -v /dev:/dev -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $HOME/Cobots-A/catkin_ws/src:/root/catkin_ws/src \
        -v $HOME/Desktop/docker:/root/upload \
        registry.cn-hangzhou.aliyuncs.com/ocrtoc2021/release:2.1
sudo xhost +local:`docker inspect --format='{{ .Config.Hostname }}' ocrtoc`
