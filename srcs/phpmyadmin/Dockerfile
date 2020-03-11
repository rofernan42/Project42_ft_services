# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rofernan <rofernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/06 14:36:57 by rofernan          #+#    #+#              #
#    Updated: 2020/03/11 18:05:07 by rofernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest
LABEL	maintainer="Rofernan (rofernan@42.fr)"

RUN		apk update \
		&& apk upgrade \
		&& apk add wget \
		&& apk add bash \
		&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
		&& tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
		&& rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
		&& mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin \
		&& chmod 755 -R /phpmyadmin

COPY	config.inc.php /phpmyadmin
COPY	my-phpmyadmin.sh .

EXPOSE	5000

CMD		["sh", "my-phpmyadmin.sh"]