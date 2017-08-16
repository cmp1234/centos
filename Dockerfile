FROM centos:7.3.1611

ENV SSH_VERSION 7.4p1
ENV SSH_DOWNLOAD_URL http://mirrors.sonic.net/pub/OpenBSD/OpenSSH/portable/openssh-7.4p1.tar.gz
#ENV SSH_DOWNLOAD_SHA 6eaacfa983b287e440d0839ead20c2231749d5d6b78bbe0e0ffa3a890c59ff26

COPY build_openssh.sh /build_openssh.sh
RUN chmod +x /build_openssh.sh


RUN yum upgrade -y && \
    yum install wget && \
    yum erase -y vim-minimal &&\
    rpm -e yum-utils yum-plugin-ovl \
	yum-plugin-fastestmirror yum && \
    /build_openssh.sh


ADD docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 22
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/local/openssh/sbin/sshd","-D"]
