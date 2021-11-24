FROM gitpod/workspace-full

USER root
RUN apt-get update && apt-get install -y mysql-client && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN echo "[mysql]" > /etc/mysql/conf.d/mysql.cnf
RUN echo "host=0.0.0.0" >> /etc/mysql/conf.d/mysql.cnf
RUN echo "user=uberflip" >> /etc/mysql/conf.d/mysql.cnf
RUN echo "password=pass123" >> /etc/mysql/conf.d/mysql.cnf
RUN echo "database=university" >> /etc/mysql/conf.d/mysql.cnf