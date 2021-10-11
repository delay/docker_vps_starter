# 66analytics_docker

Setting up docker containers on VPS

first need a reverse proxy to map my port 80 subdomains to various ports and containers setup in docker.
https://hub.docker.com/r/nginxproxy/nginx-proxy
explained here: https://blog.florianlopes.io/host-multiple-websites-on-single-host-docker/

command to setup docker automated reverse proxy container.
`docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro nginxproxy/nginx-proxy`

in other containers you need the environment:
VIRTUAL_HOST and VIRTUAL_PORT settings.
```yaml
jenkins:
  image: jenkins
  expose:
    - 8080
    - 50000
  environment:
    - "VIRTUAL_HOST=jenkins.domain.com"
    - "VIRTUAL_PORT=8080"
  volumes:
    - "/your/home:/var/jenkins_home"
```
Map a container to multiple domains:
A common requirement is using multiple domains for a given container. To do this, simply add hosts to VIRTUAL_HOST variable like this:
VIRTUAL_HOST=domain.com,www.domain.com,home.domain.com


setup lamp stack 
https://blog.tkav.dev/running-your-lamp-stack-on-docker-containers

https://stackoverflow.com/questions/58012687/php-container-cant-connect-to-mysql-container

Running the command docker network inspect backend I can see that these three containers on the same network.  can also see the ip address of the connection.
`docker network inspect backend`

`docker container ls` to get container id.
then to ssh into docker container
`docker exec -it ee72b8e89a0f sh`

Troubleshooting.  When setting up go to the root url and look at error message.  Once it says no analytics db found you know connection is good.  Then add the analytics database in mysql.  then go to session.ubookworm.com/install put "db" for the db host. Make sure you don't add a port to the "db" or it will fail.  db is the name of the mysql database in docker composer.


