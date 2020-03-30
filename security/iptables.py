#!/usr/bin/env python3

import subprocess
import urllib.request

def shell(cmd):
    return subprocess.call(cmd, shell=True)

def shell_out(cmd):
    return subprocess.check_output(cmd, shell=True, text=True).rstrip()

def docker_compose_ip(service_name):
    container_id = shell_out("docker-compose ps -q " + f"{service_name}")
    return shell_out("docker inspect -f \"{{ range .NetworkSettings.Networks }}{{ .IPAddress }}{{ end }}\" " + f"{container_id}")

def ip_src_list(url):
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req) as res:
        body = res.read()
        return body.decode("UTF-8").split()

bungee_ip = docker_compose_ip("bungee")
database_ip = docker_compose_ip("database")
web_ip = docker_compose_ip("web")

if shell("iptables -V") != 0:
    exit()

if shell("iptables -n -L AZI_DOCKER") != 0:
    shell("iptables -N AZI_DOCKER")
else:
    shell("iptables -F AZI_DOCKER")

for local_ip_src in ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]:
    shell(f"iptables -A AZI_DOCKER -p tcp -s {local_ip_src} -d {web_ip} --dport 443 -j ACCEPT")
    shell(f"iptables -A AZI_DOCKER -p tcp -s {local_ip_src} -d {database_ip} --dport 3306 -j ACCEPT")
    shell(f"iptables -A AZI_DOCKER -p tcp -s {local_ip_src} -d {bungee_ip} -m multiport --dports 8192,25577 -j ACCEPT")

for uptime_robot_ip_src in ip_src_list("https://uptimerobot.com/inc/files/ips/IPv4.txt"):
    shell(f"iptables -A AZI_DOCKER -p tcp -s {uptime_robot_ip_src} -d {web_ip} --dport 443 -j ACCEPT")
    shell(f"iptables -A AZI_DOCKER -p tcp -s {uptime_robot_ip_src} -d {bungee_ip} -m multiport --dports 8192,25577 -j ACCEPT")

for cloudflare_ip_src in ip_src_list("https://www.cloudflare.com/ips-v4"):
    shell(f"iptables -A AZI_DOCKER -p tcp -s {cloudflare_ip_src} -d {web_ip} --dport 443 -j ACCEPT")

shell(f"iptables -A AZI_DOCKER -p tcp -s 52.197.94.253 -d {bungee_ip} --dport 8192 -j ACCEPT")

shell(f"iptables -A AZI_DOCKER -p tcp -s 13.231.99.109 -d {bungee_ip} --dport 25577 -j ACCEPT")
shell(f"iptables -A AZI_DOCKER -p tcp -s 167.179.81.253 -d {bungee_ip} --dport 25577 -j ACCEPT")
shell(f"iptables -A AZI_DOCKER -p tcp -s 202.182.123.235 -d {bungee_ip} --dport 25577 -j ACCEPT")
shell(f"iptables -A AZI_DOCKER -p tcp -s 45.77.10.15 -d {bungee_ip} --dport 25577 -j ACCEPT")

shell(f"iptables -A AZI_DOCKER -p tcp -d {web_ip} --dport 443 -j DROP")
shell(f"iptables -A AZI_DOCKER -p tcp -d {database_ip} --dport 3306 -j DROP")
shell(f"iptables -A AZI_DOCKER -p tcp -d {bungee_ip} --dport 8192 -j DROP")
shell(f"iptables -A AZI_DOCKER -p tcp -d {bungee_ip} --dport 25577 -j DROP")

before_rules = [rule for rule in shell_out("iptables -S DOCKER").split("\n") if rule.startswith("-A")]

shell(f"iptables -A DOCKER -p tcp -d {web_ip} --dport 443 -j AZI_DOCKER")
shell(f"iptables -A DOCKER -p tcp -d {database_ip} --dport 3306 -j AZI_DOCKER")
shell(f"iptables -A DOCKER -p tcp -d {bungee_ip} --dport 8192 -j AZI_DOCKER")
shell(f"iptables -A DOCKER -p tcp -d {bungee_ip} --dport 25577 -j AZI_DOCKER")

for before_rule in before_rules:
    shell("iptables -D " + before_rule[3:])
