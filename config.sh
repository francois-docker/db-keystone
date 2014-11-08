#! /bin/bash
sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/my.cnf

/etc/init.d/mysql start

cat << EOF | mysql -u root --password=neutre
CREATE DATABASE keystone;
GRANT ALL PRIVILEGES ON keystone.* TO "keystone"@"localhost" IDENTIFIED BY "keystone";
GRANT ALL PRIVILEGES ON keystone.* TO "keystone"@"%" IDENTIFIED BY "keystone";
EOF

/usr/bin/mysql -ukeystone -pkeystone keystone < /config/keystone-db.dump
/etc/init.d/mysql stop
