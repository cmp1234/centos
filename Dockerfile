FROM centos:7.3.1611


RUN yum update -y && \
    rpm -e libtasn1 \
	expat 
	
