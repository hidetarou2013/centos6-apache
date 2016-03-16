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

# tag:SVN1.6.11
RUN yum install -y subversion
RUN mkdir /var/lib/svnrepos/
ADD create_svn_repo.sh /tmp/
RUN chmod 755 /tmp/create_svn_repo.sh
RUN exec sh /tmp/create_svn_repo.sh tmp1
ADD subversion.conf /etc/httpd/conf.d/
ADD svnrepos_pass /etc/httpd/conf/

#CMD /usr/sbin/httpd -DFOREGROUND
ENTRYPOINT /etc/init.d/httpd start && /etc/rc.d/init.d/svnserve restart && /bin/bash