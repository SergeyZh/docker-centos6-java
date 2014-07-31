FROM sergeyzh/centos6-epel

MAINTAINER Sergey Zhukov, sergey@jetbrains.com

RUN mkdir /usr/java64 ; cd /usr/java64/ ; \
     wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz ; \
     cd /usr/java64/ ; tar -xzf jdk-7u65-linux-x64.tar.gz ; rm jdk-7u65-linux-x64.tar.gz ; \
     cd /usr/java64/ ; ln -s jdk1.7.0_65 current ; \
     chown -R root:root /usr/java64 ; \
     chmod -R a+rwX /usr/java64

ENV JAVA_HOME /usr/java64/current
ENV JDK_HOME ${JAVA_HOME}
ENV PATH ${JAVA_HOME}/bin:${PATH}

CMD /bin/bash

