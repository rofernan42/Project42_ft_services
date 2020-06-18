# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rofernan <rofernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/04 10:54:01 by rofernan          #+#    #+#              #
#    Updated: 2020/03/12 15:08:36 by rofernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest
LABEL	maintainer="Rofernan (rofernan@42.fr)"

RUN	apk update \
	&& apk add bash \
	&& apk add openssl \
	&& apk add openssh-client openssh-server \
	&& printf "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add proftpd@testing=1.3.7_rc4-r0

RUN	mkdir -p /var/run/proftpd

#RUN	rm /etc/nginx/nginx.conf
#COPY	nginx.conf /etc/nginx/nginx.conf

COPY	my-ftps.sh .
#COPY	index.html /usr/share/nginx/html/

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=rofernan' -keyout /etc/ssl/private/ftps-selfsigned.key -out /etc/ssl/certs/ftps-selfsigned.crt

EXPOSE	21

CMD	["sh", "my-ftps.sh"]
