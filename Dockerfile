#Docker to develop/try Ansible module for Fortigate
#Start with ubuntu 
#build cmd:
# docker build --force-rm -t 40ansible-playbook:1.2 .
# docker build --force-rm -t 40ansible-playbook .
FROM ubuntu:18.04
MAINTAINER Nicolas Thomas <nthomas@fortinet.com>
#Update the Ubuntu software repository inside the dockerfile with the 'RUN' command.
# Update Ubuntu Software repository
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get -y install bash python-pip ansible sudo
RUN apt clean
RUN pip install fortiosapi
RUN groupadd -r ubuntu && useradd  -g ubuntu -G adm,sudo ubuntu -m -p fortinet -s /bin/bash && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/99-nopasswd && chmod 640 /etc/sudoers.d/99-nopasswd
USER ubuntu
COPY 40ansible/library /usr/lib/python2.7/dist-packages/ansible/modules/network/fortios

ENTRYPOINT ["/bin/bash", "-c", "ansible-playbook \"$@\"", "--"]
