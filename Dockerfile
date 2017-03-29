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
RUN apt-get install -y maven
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y docker.io
RUN apt-get install -y awscli
RUN apt-get install -y libfontconfig1
RUN apt-get install -y libtime-duration-perl
RUN apt-get install -y cpanminus
RUN apt-get install -y moreutils
RUN apt-get install -y task-spooler
RUN apt-get install -y rubygems
RUN gem install rake
RUN gem install github_changelog_generator
RUN apt-get -y install python-pip
RUN pip install docker-compose

