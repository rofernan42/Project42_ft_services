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

if ! minikube status > /dev/null 2>&1
then
	echo "Starting Minikube"
	rm -rf ~/.minikube
	mkdir -p /goinfre/${USER}/.minikube
	ln -sf /goinfre/${USER}/.minikube ~/.minikube
	minikube start --vm-driver=virtualbox --cpus=2 --disk-size=30000mb --memory=3000mb --extra-config=apiserver.service-node-port-range=1-35000
	minikube addons enable metrics-server
	minikube addons enable ingress
	minikube addons enable dashboard
fi

server_ip=`minikube ip`

# cp srcs/wordpress/wp-config_restore.php srcs/wordpress/wp-config.php
# sed -i.restore "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/wordpress/wp-config.php
# sed -i.restore "s/http:\/\/IP/http:\/\/"$server_ip"/g" srcs/mysql/wordpress.sql
sed -i.restore "s/http:\/\/"$server_ip"/http:\/\/IP/g" srcs/mysql/wordpress.sql


# eval $(minikube docker-env)


# docker build -t my-nginx ./srcs/nginx
# docker build -t my-mysql ./srcs/mysql
# docker build -t my-wordpress ./srcs/wordpress
# docker build -t my-phpmyadmin ./srcs/phpmyadmin


# kubectl apply -k ./srcs/
# kubectl apply -f ./srcs/nginx.yaml
# kubectl apply -f ./srcs/mysql.yaml
# kubectl apply -f ./srcs/wordpress.yaml
# kubectl apply -f ./srcs/phpmyadmin.yaml
# kubectl apply -f ./srcs/kustomization.yaml


# deploy web dashboard Kubernetes. Useful to manage the cluster.
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml