# interview-eng-ii

## Technology Used

- [Gitpod](https://gitpod.io)
- [NGINX](https://nginx.org)
- [MySQL](https://dev.mysql.com/doc/refman/8.0/en/)
- [RabbitMQ](https://www.rabbitmq.com/)

## Your Tasks

Test description here.

## Development Environment

The Gitpod environment provides an instance of VS Code for you to accomplish your tasks.  You may install any additional tools you need using the [Gitpod](https://www.gitpod.io/docs/getting-started) or [Docker](https://docs.docker.com/compose/) config files.  Make sure that any tools your solution requires are installed and  configured in code, otherwise the interviewer will not be able to replicate your solution.

If you close a preview window, you can re-open it by clicking on the Remote Explorer tab on the left-hand sidebar.  Find the port you want to preview (e.g. `8080`) and click the Open Preview or Open Browser icon.

## Available Services

There are some services available for you to use if you wish. Instructions are included below to help you get started.

### NGINX (Web Server)

Available on port `8080`.  Default config is in /config/nginx.conf and it will serve content out of /web/.

### MySQL 8 (Database)

Available on port `3306`.  An instance of Adminer has been provided on port `8033` as well.  To access it, use the Remote Explorer tab and Preview the port.  These options have been preset for you in the CLI config.

- Username: uberflip
- Password: pass123
- Database: university

Note: The MySQL instance may take some time to start up, check the Docker output to make sure it is ready otherwise you will get connection errors.

### RabbitMQ (Message Broker)

Available on standard ports (eg. `5672` or `5552`) via `localhost`. The management plugin is also enabled and accessible on port `15672`, and can be opened using the Remote Explorer Activity View. Feel free to use one of the many [client libraries](https://www.rabbitmq.com/devtools.html) to interact with the service.

#### Connection Details

| Parameter | Value     |
| ----------| --------- |
| host      | localhost |
| port      | 5672      |
| vhost     | /         |
| username  | guest     |
| password  | guest     |
