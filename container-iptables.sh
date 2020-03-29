#!/bin/ash

set -eu

BUNGEE_IP=$(docker inspect -f '{{ range .NetworkSettings.Networks }}{{ .IPAddress }}{{ end }}' $(docker-compose ps -q bungee))
WEB_IP=$(docker inspect -f '{{ range .NetworkSettings.Networks }}{{ .IPAddress }}{{ end }}' $(docker-compose ps -q web))

LOCAL_IP_SOURCE=$(echo $'10.0.0.0/8\n172.16.0.0/12\n192.168.0.0/16')
UPTIME_ROBOT_IP_SOURCE=$(wget -O - https://uptimerobot.com/inc/files/ips/IPv4.txt | tr -d '\r')
CLOUDFLARE_IP_SOURCE=$(wget -O - https://www.cloudflare.com/ips-v4)

iptables -N AZI_WEB
echo "$LOCAL_IP_SOURCE" | xargs -I {} iptables -A AZI_WEB -p tcp -s {} -d $WEB_IP --dport 443 -j ACCEPT
echo "$UPTIME_ROBOT_IP_SOURCE" | xargs -I {} iptables -A AZI_WEB -p tcp -s {} -d $WEB_IP --dport 443 -j ACCEPT
echo "$CLOUDFLARE_IP_SOURCE" | xargs -I {} iptables -A AZI_WEB -p tcp -s {} -d $WEB_IP --dport 443 -j ACCEPT
iptables -A AZI_WEB -p tcp -s 0.0.0.0/0 -d $WEB_IP --dport 443 -j DROP
iptables -A DOCKER -p tcp -s 0.0.0.0/0 -d $WEB_IP --dport 443 -j AZI_WEB
iptables -D DOCKER -p tcp -s 0.0.0.0/0 -d $WEB_IP --dport 443 -j ACCEPT

iptables -N AZI_VOTIFIER
echo "$LOCAL_IP_SOURCE" | xargs -I {} iptables -A AZI_BUNGEE -p tcp -s {} -d $BUNGEE_IP --dport 8192 -j ACCEPT
echo "$UPTIME_ROBOT_IP_SOURCE" | xargs -I {} iptables -A AZI_VOTIFIER -p tcp -s {} -d $BUNGEE_IP --dport 8192 -j ACCEPT
iptables -A AZI_VOTIFIER -p tcp -s 52.197.94.253 -d $BUNGEE_IP --dport 8192 -j ACCEPT
iptables -A AZI_VOTIFIER -p tcp -s 0.0.0.0/0 -d $BUNGEE_IP --dport 8192 -j DROP
iptables -A DOCKER -p tcp -s 0.0.0.0/0 -d $BUNGEE_IP --dport 8192 -j AZI_VOTIFIER
iptables -D DOCKER -p tcp -s 0.0.0.0/0 -d $BUNGEE_IP --dport 8192 -j ACCEPT

iptables -N AZI_BUNGEE
echo "$LOCAL_IP_SOURCE" | xargs -I {} iptables -A AZI_BUNGEE -p tcp -s {} -d $BUNGEE_IP --dport 25577 -j ACCEPT
echo "$UPTIME_ROBOT_IP_SOURCE" | xargs -I {} iptables -A AZI_BUNGEE -p tcp -s {} -d $BUNGEE_IP --dport 25577 -j ACCEPT
iptables -A AZI_BUNGEE -p tcp -s 13.231.99.109 -d $BUNGEE_IP --dport 25577 -j ACCEPT
iptables -A AZI_BUNGEE -p tcp -s 167.179.81.253 -d $BUNGEE_IP --dport 25577 -j ACCEPT
iptables -A AZI_BUNGEE -p tcp -s 202.182.123.235 -d $BUNGEE_IP --dport 25577 -j ACCEPT
iptables -A AZI_BUNGEE -p tcp -s 45.77.10.15 -d $BUNGEE_IP --dport 25577 -j ACCEPT
iptables -A AZI_BUNGEE -p tcp -s 0.0.0.0/0 -d $BUNGEE_IP --dport 25577 -j DROP
iptables -A DOCKER -p tcp -s 0.0.0.0/0 -d $BUNGEE_IP --dport 25577 -j AZI_BUNGEE
iptables -D DOCKER -p tcp -s 0.0.0.0/0 -d $BUNGEE_IP --dport 25577 -j ACCEPT
