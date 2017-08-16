FROM centos:7.3.1611

RUN yum -y --security update && \
    yum erase -y vim-minimal yum-plugin-ovl iputils libss &&\
    yum -y clean all
