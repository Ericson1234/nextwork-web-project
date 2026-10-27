#!/bin/bash

# Detener Apache/httpd si está corriendo
isExistApp="$(pgrep httpd)"
if [[ -n $isExistApp ]]; then
    sudo systemctl stop httpd.service
fi

# Detener Tomcat si está corriendo (ajusta la ruta si es distinta, ej: /usr/local/tomcat o /opt/tomcat)
if [ -f /opt/tomcat/bin/shutdown.sh ]; then
    sudo /opt/tomcat/bin/shutdown.sh
fi

# Opcional: Asegurarse de terminar cualquier proceso remanente de Tomcat
isExistApp="$(pgrep -f tomcat)"
if [[ -n $isExistApp ]]; then
    sudo pkill -f tomcat
fi