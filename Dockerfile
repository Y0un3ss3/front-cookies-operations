FROM adoptopenjdk/openjdk8
RUN apt-get update && apt-get install -y unzip wget maven
#COPY "./mule-ee-distribution-standalone-4.7.1.zip" .
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.zip
#RUN ls -l ap* && sleep 10
RUN unzip apache-maven-*.zip -d /opt
RUN ln -s /opt/apache-maven-3.9.8 /opt/maven

ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}

RUN wget http://185.81.166.99/mule-ee-distribution-standalone-4.7.1.zip
ENV MULE_HOME="/opt/mule"
ENV MULE_VERSION=4.7.1

RUN unzip mule-ee-distribution-standalone-4.7.1.zip -d /opt

RUN mv /opt/mule-enterprise-standalone-4.7.1 /opt/mule


VOLUME ["$MULE_HOME/logs", "$MULE_HOME/conf", "$MULE_HOME/apps", "$MULE_HOME/domains"]

WORKDIR /opt/mule/
EXPOSE 8081
ENTRYPOINT ["./bin/mule"]