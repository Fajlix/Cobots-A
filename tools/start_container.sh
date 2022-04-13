docker start real_cobotsA
sudo xhost +local:`docker inspect --format='{{ .Config.Hostname }}' real_cobotsA`
