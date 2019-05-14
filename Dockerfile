FROM debian:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
  default-jdk \
  

RUN pip install ford

RUN wget https://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar

CMD ["/bin/bash"]

WORKDIR /work
