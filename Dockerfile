FROM sergeyzh/centos6-epel

MAINTAINER Sergey Zhukov, sergey@jetbrains.com

ENV JAVA_VER 1.7.0_72
ENV JAVA_DWL_VER 7u72
ENV JAVA_DWL_BVER b14

ENV JAVA_HOME /usr/java64/current
ENV JDK_HOME ${JAVA_HOME}
ENV PATH ${JAVA_HOME}/bin:${PATH}


# Time Zone updater 2014h
ADD tzupdater.jar /

RUN mkdir /usr/java64 ; cd /usr/java64/ ; \
     wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_DWL_VER}-${JAVA_DWL_BVER}/jdk-${JAVA_DWL_VER}-linux-x64.tar.gz ; \
     cd /usr/java64/ ; tar -xzf jdk-${JAVA_DWL_VER}-linux-x64.tar.gz ; rm jdk-${JAVA_DWL_VER}-linux-x64.tar.gz ; \
     cd /usr/java64/ ; ln -s jdk${JAVA_VER} current ; \
     chown -R root:root /usr/java64 ; \
     chmod -R a+rwX /usr/java64 ; \
     ${JAVA_HOME}/bin/java -jar /tzupdater.jar -u -v


CMD /bin/bash

