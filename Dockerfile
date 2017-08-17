FROM centos:7.3.1611

RUN yum -y update && \
    yum erase -y vim-minimal yum-plugin-ovl iputils libss bind-license && \
    yum -y clean all
