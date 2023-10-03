#!/bin/bash

while getopts p: flag
do
	case "${flag}" in
		p) password=${OPTARG};;
	esac
done

# instalar as dependências
echo $password | sudo -S apt-get update -q
echo $password | sudo  -S apt-get install openjdk-8-jdk-headless > /dev/null
wget https://archive.apache.org/dist/spark/spark-3.1.2/spark-3.1.2-bin-hadoop2.7.tgz
echo $password | sudo  -S tar xf spark-3.1.2-bin-hadoop2.7.tgz
echo $password | sudo  -S sudo rm -rf spark-3.1.2-bin-hadoop2.7.tgz
pip install findspark
pip install pandas
echo "[INFO] Installation done!"