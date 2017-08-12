#!/bin/bash
echo "Checking HDFS Directories"
if $(hdfs dfs -test -d /user/admin) ; then echo "Directory already present in HDFS";else sudo -u hdfs hdfs dfs -mkdir /user/admin && sudo -u hdfs hdfs dfs -chown admin:admin /user/admin; fi
if $(hdfs dfs -test -d /user/root) ; then echo "Directory already present in HDFS";else sudo -u hdfs hdfs dfs -mkdir /user/root && sudo -u hdfs hdfs dfs -chown admin:admin /user/root; fi

if $(hdfs dfs -test -d /hive) ; then echo "Directory already present in HDFS";else sudo -u hdfs hdfs dfs -mkdir /hive && sudo -u hdfs hdfs dfs -chown admin:admin /hive; fi
if $(hdfs dfs -test -d /hive/warehouse) ; then echo "Directory already present in HDFS";else sudo -u hdfs hdfs dfs -mkdir /hive/warehouse && sudo -u hdfs hdfs dfs -chown admin:admin /hive/warehouse; fi

sed -i "s/hostname=localhost/hostname=ambari-server.dev/" /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start

while true; do
  sleep 3
  tail -f /var/log/ambari-agent/ambari-agent.log
done
