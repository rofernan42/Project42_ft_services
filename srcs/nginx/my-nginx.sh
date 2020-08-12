/usr/bin/ssh-keygen -A

adduser -D $SSH_USER
echo "$SSH_USER:$SSH_PASS" | chpasswd
sed -i.bak "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i.bak "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i.bak "s/#Port 22/Port 22000/g" /etc/ssh/sshd_config
rm /etc/ssh/sshd_config.bak

/usr/sbin/sshd

/usr/sbin/nginx -g "daemon off;"
