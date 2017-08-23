###############################################################
# A dockerfile to create a basic bamboo container.
###############################################################

FROM alpine

RUN apk --update add openssl openjdk8

RUN wget http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-6.1.1.tar.gz
RUN ls
RUN tar -xvzf atlassian-bamboo-6.1.1.tar.gz
RUN ls
RUN mkdir -p /opt/bamboo
RUN cp -R atlassian-bamboo-6.1.1/* /opt/bamboo
RUN ls
RUN java -version
RUN mkdir /home/bamboo
RUN ls /home
RUN ls /opt/bamboo
RUN cat /opt/bamboo/bin/start-bamboo.sh
RUN cat /opt/bamboo/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties
RUN sed -i 's/\#bamboo\.home\=C\:\/bamboo\/bamboo\-home/bamboo\.home\=\/home\/bamboo/g' /opt/bamboo/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties
RUN cat /opt/bamboo/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties
RUN chmod +x /opt/bamboo/bin/start-bamboo.sh
RUN cat /opt/bamboo/bin/start-bamboo.sh

ENTRYPOINT sh /opt/bamboo/bin/start-bamboo.sh -fg
