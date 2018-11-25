# Apache Proxy on Docker

## Introduction
Apache web server like proxy to services in Docker.

Enable modules :
  * proxy
  * proxy_http
  * ssl
  * headers

## Run

* Put virtual host definitin in  /etc/apache/proxy-conf on host, any .conf file will by automatycally enabled by apache.
* Link all your docker services with --link docker arg

```
    docker run --name apache-proxy \
    --volume /etc/apache/proxy-conf:/opt/proxy-conf \
    --volume /var/log/apache2:/var/log/apache2 \
    --link jira \
    --link git \
    --link nexus \
    -p 80:80 -p 443:443 \
    --restart always \
    -d lapierre/apache-proxy \
    && docker logs -f apache-proxy
```