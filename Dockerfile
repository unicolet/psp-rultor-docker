FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-get install -y debconf-utils
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y protobuf-compiler
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y awscli
RUN apt-get install -y libfontconfig1
RUN apt-get install -y libtime-duration-perl
RUN apt-get install -y cpanminus
RUN apt-get install -y moreutils
RUN apt-get install -y task-spooler
RUN apt-get install -y rubygems
RUN gem install rake
RUN gem install specific_install && gem specific_install https://github.com/Proemion/github-changelog-generator.git
RUN apt-get -y install python-pip
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable" \
    && apt-get update \
    && apt-get install -y docker-ce=17.06.0~ce-0~ubuntu
RUN pip install docker-compose
RUN curl http://ftp.heanet.ie/mirrors/www.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz \
    | tar -zxv -C /opt \
    && ln -s /opt/apache-maven-3.5.0/bin/mvn /usr/bin/mvn \
    && mvn -version

