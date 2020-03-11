sh set_db.sh & PIDIOS=$!
sh set_mysql.sh & PIDMIX=$!
wait $PIDIOS
wait $PIDMIX