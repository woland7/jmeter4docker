FROM openjdk:8-jre-slim

MAINTAINER woland7

RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
    wget \
    telnet \
    iputils-ping \
    unzip \
    curl

#Install JMeter

RUN   mkdir /jmeter \
      && cd /jmeter/ \
      && wget http://mirror.nohup.it/apache//jmeter/binaries/apache-jmeter-5.1.1.tgz \
      && tar -xzf apache-jmeter-5.1.1.tgz \
      && rm apache-jmeter-5.1.1.tgz

ENV JMETER_HOME /jmeter/apache-jmeter-5.1

ENV PATH $JMETER_HOME/bin:$PATH

EXPOSE 8080

WORKDIR /jmeter

ADD test.jmx test.jmx

ADD startup.sh startup.sh

RUN chmod 777 -R /jmeter

ENTRYPOINT ["./startup.sh"]
