FROM centos:7.3.1611

ENV SSH_VERSION 7.4p1
ENV SSH_DOWNLOAD_URL http://mirrors.sonic.net/pub/OpenBSD/OpenSSH/portable/openssh-7.4p1.tar.gz
#ENV SSH_DOWNLOAD_SHA 6eaacfa983b287e440d0839ead20c2231749d5d6b78bbe0e0ffa3a890c59ff26

COPY build_openssh.sh /build_openssh.sh
RUN chmod +x /build_openssh.sh


RUN build_deps='wget gcc make openssl-devel zlib-devel' && \
    yum -y --security update && \
    yum install -y $build_deps && \
    yum erase -y vim-minimal yum-plugin-ovl iputils libss &&\
    /build_openssh.sh && \
    yum erase -y $build_deps && \
    yum -y clean all


ADD docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 22
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/local/openssh/sbin/sshd","-D"]
