#!/bin/bash

# This script will install the Laravel Sail container and
# configure it for Gitpod.

# First, install the latest composer
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
# Overwrite the old version provided by Gitpod
sudo mv composer.phar /usr/bin/composer

# Create the app
docker info > /dev/null 2>&1

# Ensure that Docker is running...
if [ $? -ne 0 ]; then
    echo "Docker is not running."
    exit 1
fi

docker run --rm -v "$(pwd)":/opt -w /opt --platform=linux/amd64 laravelsail/php80-composer:latest bash -c "laravel new university && cd university && php ./artisan sail:install --with=redis,meilisearch,mailhog,selenium "

cd university

echo ""

sudo chown -R $USER: .

# Modify default .env.example to work in Gitpod
sed -i 's/APP_URL=.*/APP_URL="${GITPOD_WORKSPACE_URL}"/' .env.example
sed -i '/^APP_URL/a APP_PORT=9080' .env.example
sed -i 's/DB_HOST=.*/DB_HOST=0.0.0.0/' .env.example

# Set up bash alias for Sail
echo "RUN echo \"alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'\" >> ~/.bashrc" >> .gitpod.Dockerfile
# Create the default .env from the example
echo "RUN @php -r \"file_exists('.env') || copy('.env.example', '.env');\"" >> .gitpod.Dockerfile

cd ..

# Add the port config to .gitpod.yml
sed -i '/^ports:/a\  - port: 6379\n    onOpen: ignore' .gitpod.yml
sed -i '/^ports:/a\  - port: 1025\n    onOpen: ignore' .gitpod.yml
sed -i '/^ports:/a\  - port: 8025\n    onOpen: ignore' .gitpod.yml
sed -i '/^ports:/a\  - port: 7700\n    onOpen: ignore' .gitpod.yml
sed -i '/^ports:/a\  - port: 9080\n    onOpen: open-preview' .gitpod.yml

# Add a terminal to run Sail
sed -i '/# Additional Terminals/a\  - name: Sail\n    init: cd university && composer update && composer install && sail up --no-start --build\n    command: sail up\n    openMode: tab-after' .gitpod.yml

echo -e "Laravel installed successfully.  Please continue with the challenge instructions."
