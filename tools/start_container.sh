docker start cobotsA
sudo xhost +local:`docker inspect --format='{{ .Config.Hostname }}' cobotsA`
