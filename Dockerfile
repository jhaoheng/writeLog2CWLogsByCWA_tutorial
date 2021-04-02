FROM ubuntu:16.04

RUN apt-get update && apt-get install -y vim procps wget make

RUN cd /tmp && \
    wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb && \
    dpkg -i -E ./amazon-cloudwatch-agent.deb

# Fixed the 
RUN cd /tmp && \
    wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /usr/local/bin/systemctl && \
    apt-get install -y python

CMD ["/sbin/init"]