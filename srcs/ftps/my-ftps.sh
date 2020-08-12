mkdir -p /ftps/$FTP_USER
adduser -h /ftps/$FTP_USER -D $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
cat etc/ssl/certs/pure-ftpd.crt >> etc/ssl/private/pure-ftpd.pem
/usr/sbin/pure-ftpd -j -Y 2 -p 21000:21000 -P "SERVER-IP"
