#!/bin/bash

#
# [ec2-user@ip-172-31-40-102 shell]$ ./create_svn_repo.sh repo_name
#

target_dir=/var/lib/svnrepos/
cd /var/lib/svnrepos/
svnadmin create $1
svn mkdir file:///var/lib/svnrepos/$1/trunk -m "create"
svn mkdir file:///var/lib/svnrepos/$1/branches -m "create"
svn mkdir file:///var/lib/svnrepos/$1/tags -m "create"
chown -R apache:apache $1
chcon -R -t httpd_sys_content_t $1
cp /etc/httpd/conf/sample_svn_repo /etc/httpd/conf/$1
htpasswd -cbm /etc/httpd/conf/$1 kenshuu kenshuu
htpasswd -bm /etc/httpd/conf/$1 redmine redadmin
htpasswd -bm /etc/httpd/conf/$1 ken01 ken01
htpasswd -bm /etc/httpd/conf/$1 ken02 ken02
htpasswd -bm /etc/httpd/conf/$1 ken03 ken03
htpasswd -bm /etc/httpd/conf/$1 ken04 ken04
htpasswd -bm /etc/httpd/conf/$1 ken05 ken05
htpasswd -bm /etc/httpd/conf/$1 ken06 ken06
htpasswd -bm /etc/httpd/conf/$1 ken07 ken07
htpasswd -bm /etc/httpd/conf/$1 ken08 ken08
htpasswd -bm /etc/httpd/conf/$1 ken09 ken09
htpasswd -bm /etc/httpd/conf/$1 ken10 ken10
htpasswd -bm /etc/httpd/conf/$1 ken11 ken11
htpasswd -bm /etc/httpd/conf/$1 ken12 ken12
htpasswd -bm /etc/httpd/conf/$1 ken13 ken13
htpasswd -bm /etc/httpd/conf/$1 ken14 ken14
htpasswd -bm /etc/httpd/conf/$1 ken15 ken15
htpasswd -bm /etc/httpd/conf/$1 ken16 ken16
htpasswd -bm /etc/httpd/conf/$1 ken17 ken17
htpasswd -bm /etc/httpd/conf/$1 ken18 ken18

ls -l $target_dir

sed -i -e 's/tmp1/"$1"/g' /etc/httpd/conf.d/subversion.conf
cat -n /etc/httpd/conf.d/subversion.conf | grep $1

exit 0
