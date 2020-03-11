until mysql
do
	echo "WAIT"
done

mysql < create_db.sql
mysql wordpress < wordpress.sql