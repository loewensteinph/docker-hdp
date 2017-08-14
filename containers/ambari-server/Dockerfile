FROM centos:6
ARG AMBARI_REPO_URL
RUN yum install -y wget sudo net-tools
RUN wget -nv ${AMBARI_REPO_URL} -O /etc/yum.repos.d/ambari.repo
RUN yum install -y ambari-server postgresql-jdbc
RUN ambari-server setup --database=postgres --databasehost=postgres.dev --databaseport=5432 --databasename=ambari --postgresschema=ambari  --databaseusername=ambari --databasepassword=dev --silent
RUN ambari-server setup --jdbc-db postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar
ENV JAVA_HOME /usr/lib/jvm/jre-openjdk
ADD scripts/start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh
