#sh set_influxd.sh & PIDMIX=$!
#sh set_db.sh & PIDIOS=$!
#wait $PIDMIX
#wait $PIDIOS

#/bin/bash
influxd run -config /etc/influxdb.conf
