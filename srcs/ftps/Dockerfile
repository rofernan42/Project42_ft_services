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
	&& printf "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add pure-ftpd@testing

COPY	my-ftps.sh .

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=rofernan' -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/certs/pure-ftpd.crt

EXPOSE	21 21000

CMD	["sh", "my-ftps.sh"]
