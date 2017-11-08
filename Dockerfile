FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y debconf-utils \
    software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get update
RUN apt-get install -y protobuf-compiler \
    python-software-properties \
    oracle-java8-installer \
    git \
    curl \
    awscli \
    libfontconfig1 \
    libtime-duration-perl \
    cpanminus \
    moreutils \
    task-spooler \
    rubygems \
    apt-transport-https \
    ca-certificates \
    python-pip
RUN gem install rake
RUN gem install specific_install && gem specific_install https://github.com/Proemion/github-changelog-generator.git
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable" \
    && apt-get update \
    && apt-get install -y docker-ce=17.06.0~ce-0~ubuntu
RUN pip install docker-compose
RUN curl https://archive.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz \
    | tar -zxv -C /opt \
    && ln -s /opt/apache-maven-3.5.0/bin/mvn /usr/bin/mvn \
    && mvn -version
RUN useradd -u 1000 -m user

