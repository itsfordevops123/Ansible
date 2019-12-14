#!/bin/bash
a="pawnee"
b="shawnee"
c="sioux"
d= "httpd"
home=/opt/gsit
for i in a
do
    timeout 1300 $home/$a/tomee-bin/shutdown.sh
    if [[ $? -eq 0 ]]
        then
        echo " Pawnee tomee application has stopped"
        exit 0
        else
        echo "pawnee tomcat application errored"
        exit 1
    fi
done

for i in b
do
    timeout 1300 $home/$b/tomee-bin/shutdown.sh
    if [[ $? -eq 0 ]]
        then
        echo " Shawnee tomee application has stopped"
        exit 0
        else
        echo "Shawnee tomcat application errored"
        exit 1
    fi
done

for i in c
do
    timeout 1300 $home/$c/tomee-bin/shutdown.sh
    if [[ $? -eq 0 ]]
        then
        echo " Sioux tomee application has stopped"
        exit 0
        else
        echo "Sioux tomcat application errored"
        exit 1
    fi
done

for i in d
do
    timeout 1300 $home/$d/tomee-bin/shutdown.sh
    if [[ $? -eq 0 ]]
        then
        echo " Apache httpd application has stopped"
        exit 0
        else
        echo "Apache httpd application errored"
        exit 1
    fi
done

