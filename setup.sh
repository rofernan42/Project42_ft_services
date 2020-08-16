if ! which docker > /dev/null 2>&1
then
	echo "Please install Docker"
	exit 1
fi

if ! which minikube > /dev/null 2>&1
then
	echo "Please install Minikube"
	exit 1
fi

if ! which kubectl > /dev/null 2>&1
then
	echo "Please install Kubectl"
	exit 1
fi

# Install last version of Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube /usr/local/bin
rm minikube

if ! minikube status > /dev/null 2>&1
then
	echo "Starting Minikube"
	minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000
	sudo usermod -aG docker $(whoami)
fi

minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

server_ip="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

# Replace by IP
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/nginx/index.html
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/wordpress/wp-config.php
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/mysql/wordpress.sql
sed -i.bak "s/SERVER-IP/"$server_ip"/g" srcs/ftps/my-ftps.sh

eval $(minikube docker-env)

# Build Docker images
docker build -t my-nginx ./srcs/nginx
docker build -t my-mysql ./srcs/mysql
docker build -t my-wordpress ./srcs/wordpress
docker build -t my-phpmyadmin ./srcs/phpmyadmin
docker build -t my-influxdb ./srcs/influxdb
docker build -t my-grafana ./srcs/grafana
docker build -t my-telegraf ./srcs/telegraf
docker build -t my-ftps ./srcs/ftps

# Put back initial settings
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/nginx/index.html
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/wordpress/wp-config.php
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/mysql/wordpress.sql
sed -i.bak "s/"$server_ip"/SERVER-IP/g" srcs/ftps/my-ftps.sh
rm srcs/wordpress/wp-config.php.bak srcs/mysql/wordpress.sql.bak srcs/nginx/index.html.bak srcs/ftps/my-ftps.sh.bak

# Deploy the apps
kubectl apply -k ./srcs/

echo "Server IP : $server_ip"
echo "username: rofernan   password: password"

minikube dashboard
