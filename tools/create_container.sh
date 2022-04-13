sudo docker rm -f real_cobotsA

sudo docker run -i -d --gpus all --name real_cobotsA --network host \
        --privileged -v /dev:/dev -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $HOME/real_robot_cobotsA:/root/ocrtoc_ws/src \
        -v $HOME/Desktop/docker:/root/upload \
        registry.cn-hangzhou.aliyuncs.com/ocrtoc2021/release:2.1
sudo xhost +local:`docker inspect --format='{{ .Config.Hostname }}' real_cobotsA`
