FROM centos:7.3.1611


RUN yum update -y && \
    rpm -e libtasn1 3.8-3.el7 \
	expat 2.1.0-10.el7_3
	
