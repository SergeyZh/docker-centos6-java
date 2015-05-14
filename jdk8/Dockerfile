FROM sergeyzh/centos6-epel

MAINTAINER Sergey Zhukov, sergey@jetbrains.com

RUN yum update -y && yum install -y unzip

ENV JAVA_VER 1.8.0_45
ENV JAVA_DWL_VER 8u45
ENV JAVA_DWL_BVER b14

ENV JAVA_HOME /usr/java64/current
ENV JDK_HOME ${JAVA_HOME}
ENV PATH ${JAVA_HOME}/bin:${PATH}

ENV TZUPDATER 2015a


RUN mkdir /usr/java64 ; cd /usr/java64/ ; \
     wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_DWL_VER}-${JAVA_DWL_BVER}/jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && \
     cd /usr/java64/ && tar -xzf jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && rm jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && \
     cd /usr/java64/ && ln -s jdk${JAVA_VER} current && \
     chown -R root:root /usr/java64 && \
     chmod -R a+rwX /usr/java64

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/tzupdater/2.0.0/tzupdater-2_0_0-${TZUPDATER}.zip && \
    unzip tzupdater-2_0_0-${TZUPDATER}.zip && mv tzupdater-2.0.0-${TZUPDATER}/tzupdater.jar /

RUN ${JAVA_HOME}/bin/java -jar /tzupdater.jar -t -v || ${JAVA_HOME}/bin/java -jar /tzupdater.jar -u -v && rm -rf /tzupdater-2_0_0-${TZUPDATER}.zip tzupdater-2.0.0-${TZUPDATER} /tzupdater.jar

CMD /bin/bash

