#! /bin/bash
sudo yum update
sudo yum install -y httpd
sudo chkconfig httpd on
sudo service httpd start
sudo rm -rf /var/www/html/index.html
sudo chown -R www-data:www-data /var/www
