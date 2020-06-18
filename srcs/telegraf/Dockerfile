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
	&& apk add bash \
	&& printf "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add telegraf@testing=1.14.3-r0

COPY	my-telegraf.sh .

EXPOSE	8125

CMD	["sh", "my-telegraf.sh"]

