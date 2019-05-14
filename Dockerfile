FROM ubuntu:latest

RUN yes | unminimize && \
    apt-get install -y man-db && \
    rm -r /var/lib/apt/lists/*

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  make \
  git-core \
  git-svn \
  subversion \
  python-pip \
  python-dev \
  wget \
  vim \
  pandoc \
  graphviz \
  default-jdk 
  

RUN pip install ford

CMD ["/bin/bash"]

WORKDIR /work

RUN wget https://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar
