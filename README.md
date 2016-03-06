# centos6-apache

centos6-apache コンテナの使用方法

## 1.git clone

```sh
$ git clone git@github.com:hidetarou2013/centos6-apache.git
```

## 2.docker build

```sh
$ cd centos6-apache
$ docker build -t hidetarou2013/centos6-apache .
$ docker build -t hidetarou2013/centos6-apache:Apache2.2.15 .
$ docker build -t hidetarou2013/centos6-apache:SSL .
$ docker build -t hidetarou2013/centos6-apache:PHP5.3.3 .

```

## 3.docker run

■WEBコンテンツ（in DockerHost）
/home/vagrant/web-contents/

```sh
$ docker run --name myapache6 -i -t --rm -v /home/vagrant/web-contents/:/var/www/html/ -p 80:80 -p 443:443 hidetarou2013/centos6-apache
$ docker run --name myapache6 -i -t --rm -v /home/vagrant/web-contents/:/var/www/html/ -p 80:80 -p 443:443 hidetarou2013/centos6-apache:Apache2.2.15
$ docker run --name myapache6 -i -t --rm -v /home/vagrant/web-contents/:/var/www/html/ -p 80:80 -p 443:443 hidetarou2013/centos6-apache:SSL
$ docker run --name myapache6 -i -t --rm -v /home/vagrant/web-contents/:/var/www/html/ -p 80:80 -p 443:443 hidetarou2013/centos6-apache:PHP5.3.3
```

