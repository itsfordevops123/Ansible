#!/bin/bash
a="pawnee"
b="shawnee"
c="sioux"
d= "httpd"
home=/opt/gsit
for i in $a $b $c
do
    timeout 1300 $home/$i/tomee-bin/shutdown.sh
    if [[ $? -eq 0 ]]
        then
        echo " $i Tomee application has stopped"
        exit 0
        else
        echo "$i tomcat application errored"
        exit 1
    fi
i=$i++
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