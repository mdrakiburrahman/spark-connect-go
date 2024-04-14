#!/bin/bash -e

echo "Starting Apache Spark..."

if pgrep -f "org.apache.spark.deploy.master.Master" >/dev/null; then
    echo "Spark Master already running"
else
    echo "Spark is not running. Starting..."
    sudo /opt/spark/sbin/start-master.sh
fi

if pgrep -f "org.apache.spark.deploy.worker.Worker" >/dev/null; then
    echo "Spark Worker already running"
else
    echo "Spark Worker is not running. Starting..."
    sudo /opt/spark/sbin/start-worker.sh spark://$(hostname):7077
fi

if pgrep -f "org.apache.spark.sql.connect.service.SparkConnectServer" >/dev/null; then
    echo "Spark Connect is already running"
else
    echo "Spark Connect is not running. Starting..."
    sudo /opt/spark/sbin/start-connect-server.sh --packages org.apache.spark:spark-connect_2.12:3.4.0
fi

echo
echo "------------------------------------------"
echo "Master UI:           http://localhost:8080"
echo "Workers UI:          http://localhost:8081"
echo "Connect Endpoint:    sc://localhost:15002"
echo "------------------------------------------"
echo
echo "Post-Attach Commands Complete!"
echo
