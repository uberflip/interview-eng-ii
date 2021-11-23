# interview-eng-ii

## Available Services
There are some services available for you to use if you wish. Instructions are included below to help you get started.

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

### MySQL 8 (Database)
Available on port `3306`.  An instance of Adminer has been provided on port `8080` as well.  These options have been preset for you in the CLI config.
- Username: uberflip
- Password: pass123
- Database: university
Note: The MySQL instance may take some time to start up, check the Docker output to make sure it is ready otherwise you will get connection errors.