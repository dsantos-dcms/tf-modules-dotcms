## Update and enable Amazon Extras
sudo yum update -y
sudo  amazon-linux-extras install epel -y

## Install needed app/libs for docker/docker-compose
sudo yum install docker haveged gcc libffi-devel python3 python3-devel openssl-devel -y

## Start haveged (collects entropy for /dev/random)
sudo systemctl start haveged
sudo systemctl enable haveged

## set elasticsearch virtual memory settings
##  Elasticsearch will not start without this
sudo sysctl -w vm.max_map_count=262144
sudo sysctl -w fs.file-max=100000

## make sure the settings stick
sudo sh -c "echo 'vm.max_map_count=262144' >> /etc/sysctl.conf"
sudo sh -c "echo 'fs.file-max=100000' >> /etc/sysctl.conf"
sudo sysctl -p

## add the ec2-user to docker
sudo usermod -a -G docker ec2-user

## edit docker file limits
sudo sh -c "echo \"OPTIONS='--default-ulimit nofile=65536:65536'\" >> /etc/sysconfig/docker"

## create a docker group and join it
newgrp docker

## Start/Enable Docker
sudo systemctl enable docker
sudo systemctl start docker

## Install pip / docker-compose
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

~/.local/bin/pip install docker-compose

## set docker-compose permissions
sudo cp ~/.local/bin/docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

## symbolic link docker-compose to your path
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

pip install 'urllib3<2.0'

## test that it works
docker-compose --version

## make data directory
sudo mkdir -p /data/dotcms
sudo chmod -R 777 /data

## Change to your work directory
cd /data/dotcms

## Chose how you want to start dotCMS  using 
## the example dotCMS docker-compose files

## Start with a demo site
#curl -o docker-compose.yml https://dotcms.com/run/demo

##   OR

## Start with an empty site
curl -o docker-compose.yml https://dotcms.com/run/clean

## Fire up dotCMS and tail the logs
docker-compose up -d && docker-compose logs -f