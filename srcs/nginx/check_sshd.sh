if [ ! "$(ps -elf | grep -v grep | grep /usr/sbin/sshd)" ]
then
	exit 1
fi
exit 0
