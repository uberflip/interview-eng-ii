#!/bin/bash

# This script will install the Laravel Sail container and
# configure it for Gitpod.

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

# Set up bash alias for Sail
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
echo "alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'" >> ~/.bashrc
source ~/.bashrc

# Modify default .env to work in Gitpod
sed -i 's/APP_URL=.*/APP_URL="${GITPOD_WORKSPACE_URL}"/' .env
sed -i '/^APP_URL/a APP_PORT=9080' .env
sed -i 's/DB_HOST=.*/DB_HOST=0.0.0.0/' .env

cd ..

# Add the port config to .gitpod.yml
sed -i '/^ports:/a\  - port: 6379\n    onOpen: ignore' .gitpod.yml
sed -i '/^ports:/a\  - port: 1025\n    onOpen: ignore' .gitpod.yml
sed -i '/^ports:/a\  - port: 8025\n    onOpen: ignore' .gitpod.yml
sed -i '/^ports:/a\  - port: 7700\n    onOpen: ignore' .gitpod.yml
sed -i '/^ports:/a\  - port: 9080\n    onOpen: open-preview' .gitpod.yml

# Add a terminal to run Sail
sed -i '/# Additional Terminals/a\  - name: Sail\n    init: cd university && sail up --no-start --build\n    command: sail up\n    openMode: tab-after' .gitpod.yml

echo -e "Laravel installed successfully.  Please continue with the challenge instructions."
