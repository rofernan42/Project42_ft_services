# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rofernan <rofernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/12 15:12:12 by rofernan          #+#    #+#              #
#    Updated: 2020/03/12 16:40:23 by rofernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest
LABEL	maintainer="Rofernan (rofernan@42.fr)"

RUN	apk update \
	&& apk add bash

RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.3-static_linux_amd64.tar.gz \
	&& tar -xvf telegraf-1.14.3-static_linux_amd64.tar.gz \
	&& cp telegraf/telegraf /usr/bin \
	&& rm -rf /telegraf telegraf-1.14.3-static_linux_amd64.tar.gz

COPY	my-telegraf.sh .

EXPOSE	8125

CMD	["sh", "my-telegraf.sh"]

