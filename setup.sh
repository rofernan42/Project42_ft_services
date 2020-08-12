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

if ! minikube status > /dev/null 2>&1
then
	echo "Starting Minikube"
	minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000
	sudo usermod -aG docker $(whoami)
fi

minikube addons enable metrics-server
minikube addons enable dashboard

server_ip="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

# Remplacer par IP
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/nginx/index.html
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/wordpress/wp-config.php
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/mysql/wordpress.sql
sed -i.bak "s/SERVER-IP/"$server_ip"/g" srcs/ftps/my-ftps.sh
sed -i.bak "s/IP-IP/"$server_ip"-"$server_ip"/g" srcs/my-metallb.yaml

eval $(minikube docker-env)

docker build -t my-nginx ./srcs/nginx --quiet
docker build -t my-mysql ./srcs/mysql --quiet
docker build -t my-wordpress ./srcs/wordpress --quiet
docker build -t my-phpmyadmin ./srcs/phpmyadmin --quiet
docker build -t my-influxdb ./srcs/influxdb --quiet
docker build -t my-grafana ./srcs/grafana --quiet
docker build -t my-telegraf ./srcs/telegraf --quiet
docker build -t my-ftps ./srcs/ftps --quiet

# Remettre a l'etat initial
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/nginx/index.html
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/wordpress/wp-config.php
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/mysql/wordpress.sql
sed -i.bak "s/"$server_ip"/SERVER-IP/g" srcs/ftps/my-ftps.sh
rm srcs/wordpress/wp-config.php.bak srcs/mysql/wordpress.sql.bak srcs/nginx/index.html.bak srcs/ftps/my-ftps.sh.bak srcs/my-metallb.yaml.bak

kubectl apply -k ./srcs/

echo "Server IP : $server_ip"
echo "username: rofernan   password: password"

minikube dashboard
