FROM gitpod/workspace-full

RUN sudo apt update && sudo apt install -y mysql-client
RUN sudo echo "host=0.0.0.0" >> /etc/mysql/conf.d/mysql.cnf; \
    sudo echo "user=uberflip" >> /etc/mysql/conf.d/mysql.cnf; \
    sudo echo "password=pass123" >> /etc/mysql/conf.d/mysql.cnf; \
    sudo echo "database=university" >> /etc/mysql/conf.d/mysql.cnf;