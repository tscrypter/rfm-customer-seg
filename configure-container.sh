#!/bin/bash

echo "export SPARK_HOME=/usr/local/spark-2.4.4-bin-hadoop2.7" >> ~/.profile
echo "export PATH=$PATH:/usr/local/spark-2.4.4-bin-hadoop2.7/bin" >> ~/.bashrc
echo "export SPARK_HOME=$/usr/local/spark-2.4.4-bin-hadoop2.7" >> ~/.bashrc

# Configure the source for openjdk-8 since 11 is now the default
echo "deb http://ftp.us.debian.org/debian sid main" > /etc/apt/sources.list.d/openjdk-r-ubuntu-ppa-eoan.list
apt-get update

# Install Java 8 (Required by Spark/PySpark. Validate this works with df.count())
apt-get install -y openjdk-8-jdk

# Update Java to point to java 8
update-alternatives --config java

# Install Scala/Spark
apt-get install -y scala
curl http://apache-mirror.8birdsvideo.com/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz > /usr/local/spark-2.4.4-bin-hadoop2.7.tgz \
    && tar xvf /usr/local/spark*tgz \
    && mv spark-2.4.4-bin-hadoop2.7 /usr/local/

pip install findspark
pip install pyspark
pip install jupyter

echo "source ~/.bashrc && source ~/.profile"
