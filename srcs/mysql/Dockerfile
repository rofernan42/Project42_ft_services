# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rofernan <rofernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/05 17:22:45 by rofernan          #+#    #+#              #
#    Updated: 2020/03/11 18:35:03 by rofernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest
LABEL	maintainer="Rofernan (rofernan@42.fr)"

RUN	apk update \
	&& apk upgrade \
	&& apk add bash \
	&& apk add mariadb mariadb-client \
	&& apk add --update mysql-client

COPY	create_db.sql .
COPY	wordpress.sql .
COPY	my-mysql.sh .
COPY	set_mysql.sh .
COPY	set_db.sh .

RUN	chmod 755 my-mysql.sh \
	&& chmod 755 set_mysql.sh \
	&&chmod 755 set_db.sh \
	&& chmod 755 create_db.sql

EXPOSE	3306

CMD	["sh", "my-mysql.sh"]
