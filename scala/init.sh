#!/bin/bash

pushd /root > /dev/null

if [ -d "scala" ]; then
  echo "Scala seems to be installed. Exiting."
  return 0
fi

SCALA_VERSION="2.11.7"

if [[ "0.7.3 0.8.0 0.8.1" =~ $SPARK_VERSION ]]; then
  SCALA_VERSION="2.9.3"
fi

echo "Unpacking Scala"
wget https://s3-eu-west-1.amazonaws.com/brandwatch.audiences.bootstrap/scala/scala-$SCALA_VERSION.tgz
tar xvzf scala-*.tgz > /tmp/spark-ec2_scala.log
rm scala-*.tgz
mv `ls -d scala-* | grep -v ec2` scala

popd > /dev/null
