 # syntax=docker/dockerfile:1
FROM centos:7
RUN yum -y update && \
        yum -y install httpd && \
        yum clean all


COPY modules/dispatcher-apache2.4-4.3.5.so /etc/httpd/modules/
RUN ln -s  /etc/httpd/modules/dispatcher-apache2.4-4.3.5.so /etc/httpd/modules/mod_dispatcher.so && \
     chown root:root /etc/httpd/modules/mod_dispatcher.so
COPY conf.modules.d/01-dispatcher.conf /etc/httpd/conf.modules.d/
COPY conf.d/httpd-dispatcher.conf /etc/httpd/conf.d/
COPY conf/dispatcher.any /etc/httpd/conf
COPY conf/httpd.conf /etc/httpd/conf

EXPOSE 80


WORKDIR /etc/httpd
CMD [ "apachectl", "-DFOREGROUND" ]



