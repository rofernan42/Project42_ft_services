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
		&& apk add libc6-compat \
		&& apk add bash

RUN		wget https://dl.grafana.com/oss/release/grafana-7.0.1.linux-amd64.tar.gz \
		&& tar -xvf grafana-7.0.1.linux-amd64.tar.gz \
		&& rm -rf grafana-7.0.1.linux-amd64.tar.gz

COPY		my-grafana.sh .

EXPOSE	3000

CMD		["sh", "my-grafana.sh"]
