# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rofernan <rofernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/04 11:21:07 by rofernan          #+#    #+#              #
#    Updated: 2020/03/11 17:28:07 by rofernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest
LABEL	maintainer="Rofernan (rofernan@42.fr)"

RUN		apk update \
		&& apk upgrade \
		&& apk add wget \
		&& apk add bash \
		&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		mkdir -p /var/www/wordpress

RUN		wget https://wordpress.org/latest.tar.gz \
		&& tar -xvf latest.tar.gz \
		&& rm -rf latest.tar.gz \
		&& chmod 755 -R /wordpress

COPY	wp-config.php /wordpress/wp-config.php
COPY	my-wordpress.sh .

EXPOSE	5050

CMD		["sh", "my-wordpress.sh"]