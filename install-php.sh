#/bin/sh
sudo apt-get install php7.4 php7.4-xml php7.4-json php7.4-gd php7.4-cli php7.4-mysql php7.4-zip php7.4-bcmath php7.4-mbstring -y

# if apache2 is installed..
sudo service apache2 stop
sudo systemctl disable apache2

EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
exit $RESULT

sudo apt-get install php-xdebug
