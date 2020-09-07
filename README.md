# Project42_ft_services
## Summary
This is a System Administration and Networking project.
It is an introduction to cluster management and deployment using Kubernetes technology.
## Instructions
Develop an infrastructure of different services.

Each service has to run in a dedicated container.

Each container has to be built using Alpine Linux (for performance reasons).

The images must be built by ourselves, the usage of already built images (e.g. using DockerHub) is forbidden.

The services that need to be developped:
- the Kubernetes web dashboard to manage the cluster.
- a Load Balancer (MetalLB).
- a Nginx server on ports 80 (http) and 443 (https). Port 80 should be a systematic redirection of type 301 to 443. The Nginx container must be accessed by logging into SSH.
- a FTPS server listening on port 21.
- a WordPress listening on port 5050, with a MySQL database (both in separate containers). The WordPress will have serveral users and an administrator.
- a PhpMyAdmin listening on port 5000 and linked with the MySQL database.
- a Grafana platform, listening on port 3000, linked with an InfluxDB database (both in separate containers). Grafana will monitor all the containers and one dashboard per service must be created.
- in case of a crash or stop of one of the database containers, the data must persist.
- all the containers must restart in case of a crash or stop of one of its component parts.
- the usage of Node Port services, Ingress Controller, or kubectl port-forward is prohibited.
## Usage
```
sh setup.sh
```
Note: the setup.sh is made for the Ecole 42 virtual machine.

To run on Mac, start Docker, make
```
minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
```
and run the setup.sh, it should work (not tried).

To access services: ```SERVER_IP:SERVICE_PORT```
