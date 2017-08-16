FROM centos:7.3.1611

COPY build_openssh.sh /build_openssh.sh
RUN chmod +x /build_openssh.sh

RUN build_deps='wget gcc make openssl-devel zlib-devel' && \
    yum -y --security update && \
    yum install -y $build_deps && \
    yum erase -y vim-minimal yum-plugin-ovl iputils libss &&\
    /build_openssh.sh && \
    yum erase -y $build_deps && \
    yum -y clean all

