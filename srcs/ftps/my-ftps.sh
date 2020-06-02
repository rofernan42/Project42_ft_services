/usr/bin/ssh-keygen -A

#/usr/sbin/nginx

chmod 755 /etc/ssh/*
adduser -D rofernan
sed -i.bak "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i.bak "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
rm /etc/ssh/sshd_config.bak

/usr/sbin/sshd

#sleep infinity

/bin/bash
