if ! minikube status > /dev/null 2>&1
then
	echo "Starting Minikube"
	minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000
	sudo usermod -aG docker $(whoami)
fi
