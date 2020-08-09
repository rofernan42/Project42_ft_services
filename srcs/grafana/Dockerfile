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

RUN	apk update \
	&& apk upgrade \
	&& apk add libc6-compat \
	&& apk add bash \
	&& printf "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add grafana@testing

COPY	my-grafana.sh .
COPY	dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY	influxdb.yaml /usr/share//grafana/conf/provisioning/datasources/influxdb.yaml
COPY	defaults.ini /usr/share/grafana/conf/defaults.ini
COPY	dashboards/ /usr/share/grafana/dashboards

EXPOSE	3000

CMD	["sh", "my-grafana.sh"]
