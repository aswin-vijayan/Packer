#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo chmod 777 -R /opt

sudo mv /tmp/spring-petclinic-2.7.3.jar /opt

sudo mkdir /opt/demo.txt

sudo apt install openjdk-17-jre-headless -y
