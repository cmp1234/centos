FROM centos:7.3.1611


RUN yum upgrade -y && \
    rpm -e libtasn1 \
	expat 
	
