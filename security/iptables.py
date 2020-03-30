#!/usr/bin/env python3

import subprocess
import urllib.request

def shell(cmd):
    return subprocess.call(cmd, shell=True)

def shell_out(cmd):
    return subprocess.check_output(cmd, shell=True, text=True).rstrip()

def docker_compose_ip(service):
    container_id = shell_out("docker-compose ps -q " + service)
    return shell_out("docker inspect -f \"{{ range .NetworkSettings.Networks }}{{ .IPAddress }}{{ end }}\" " + container_id)

def ip_src_list(url):
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req) as res:
        body = res.read()
        return body.decode("UTF-8").split()

def get_rules(chain):
    return [rule for rule in shell_out("iptables -S " + chain).split("\n") if rule.startswith("-A")]

def remove_rules(rules):
    for rule in rules:
        shell("iptables -D " + rule[3:])

bungee_ip = docker_compose_ip("bungee")
database_ip = docker_compose_ip("database")
web_ip = docker_compose_ip("web")

subprocess.check_call("iptables -V", shell=True)

if shell("iptables -n -L AZI_DOCKER") != 0:
    shell("iptables -N AZI_DOCKER")

before_custom_rules = get_rules("AZI_DOCKER")

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
shell(f"iptables -A AZI_DOCKER -p tcp -s 13.231.99.109,167.179.81.253,202.182.123.235,45.77.10.15 -d {bungee_ip} --dport 25577 -j ACCEPT")

shell(f"iptables -A AZI_DOCKER -p tcp -d {web_ip} --dport 443 -j DROP")
shell(f"iptables -A AZI_DOCKER -p tcp -d {database_ip} --dport 3306 -j DROP")
shell(f"iptables -A AZI_DOCKER -p tcp -d {bungee_ip} -m multiport --dports 8192,25577 -j DROP")

remove_rules(before_custom_rules)

before_docker_rules = get_rules("DOCKER")

shell(f"iptables -A DOCKER -p tcp -d {web_ip} --dport 443 -j AZI_DOCKER")
shell(f"iptables -A DOCKER -p tcp -d {database_ip} --dport 3306 -j AZI_DOCKER")
shell(f"iptables -A DOCKER -p tcp -d {bungee_ip} -m multiport --dports 8192,25577 -j AZI_DOCKER")

remove_rules(before_docker_rules)
