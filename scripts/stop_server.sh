#!/bin/bash

# Detener procesos de httpd si existen sin usar systemctl
isExistApp="$(pgrep httpd)"
if [[ -n $isExistApp ]]; then
    sudo pkill -f httpd
fi

# Detener procesos de tomcat si existen sin usar systemctl
isExistApp="$(pgrep -f tomcat)"
if [[ -n $isExistApp ]]; then
    sudo pkill -f tomcat
fi