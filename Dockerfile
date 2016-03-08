FROM centos:6.7
MAINTAINER hidetarou2013 <hidetoshi_maekawa@e-it.co.jp>

RUN yum -y update && yum -y upgrade

# tag:Apache2.2.15
RUN yum install -y httpd
EXPOSE 80 

# tag:SSL
RUN yum install -y openssl mod_ssl
EXPOSE 443

# tag:PHP5.3.3
RUN yum install -y php php-mbstring php-mysq

# tag:PHP5.3.3.1
RUN yum install -y php php-mbstring php-mysql php-devel php-mcrypt 


#CMD /usr/sbin/httpd -DFOREGROUND
ENTRYPOINT /etc/init.d/httpd start && /bin/bash