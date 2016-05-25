#!/bin/sh
while ! curl http://$MYSQL_PORT_3306_TCP_ADDR:$MYSQL_PORT_3306_TCP_PORT/
do
  echo "$(date) - still trying"
  sleep 1
done
echo "$(date) - connected successfully"