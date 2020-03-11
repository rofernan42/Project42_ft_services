# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rofernan <rofernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/04 10:54:01 by rofernan          #+#    #+#              #
#    Updated: 2020/03/10 12:21:16 by rofernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest
LABEL	maintainer="Rofernan (rofernan@42.fr)"

RUN		apk update \
		&& apk add bash \
		&& apk add openssl openssh \
		&& apk add nginx

# RUN		adduser -D -g 'www' www

RUN		mkdir -p /run/nginx
		# && mkdir /www \
		# && chown -R www:www /var/lib/nginx
		# && chown -R www:www /www

RUN		rm /etc/nginx/nginx.conf
COPY	nginx.conf /etc/nginx/nginx.conf

COPY	my-nginx.sh .
COPY	index.html /usr/share/nginx/html/

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=rofernan' -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE	80 443 22

CMD		["sh", "my-nginx.sh"]