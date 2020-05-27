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
minikube addons enable ingress
minikube addons enable dashboard


#server_ip=`minikube ip`
server_ip="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

# Remplacer par IP
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/nginx/index.html
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/wordpress/wp-config.php
sed -i.bak "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/mysql/wordpress.sql

#eval $(minikube docker-env)
docker system prune -a
docker build -t my-nginx ./srcs/nginx
#docker build -t my-mysql ./srcs/mysql
#docker build -t my-wordpress ./srcs/wordpress
#docker build -t my-phpmyadmin ./srcs/phpmyadmin
docker build -t my-influxdb ./srcs/influxdb
docker build -t my-grafana ./srcs/grafana

# Remettre a l'etat initial
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/nginx/index.html
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/wordpress/wp-config.php
sed -i.bak "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/mysql/wordpress.sql
rm srcs/wordpress/wp-config.php.bak srcs/mysql/wordpress.sql.bak srcs/nginx/index.html.bak

kubectl apply -k ./srcs/
minikube dashboard

#kubectl delete -k ./srcs/
#docker rm $(docker ps -a -f status=exited -q)
#docker rmi $(docker images -a -q)


# kubectl apply -f ./srcs/nginx.yaml
# kubectl apply -f ./srcs/mysql.yaml
# kubectl apply -f ./srcs/wordpress.yaml
# kubectl apply -f ./srcs/phpmyadmin.yaml
# kubectl apply -f ./srcs/kustomization.yaml


# deploy web dashboard Kubernetes. Useful to manage the cluster.
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
