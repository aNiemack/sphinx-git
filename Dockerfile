FROM debian:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  make \
  git-core \
  git-svn \
  subversion \
  python-pip \
  python-dev \
  wget

RUN pip install Sphinx==1.4.4 sphinx_rtd_theme alabaster sphinx_bootstrap_theme \
  docutils==0.12 \
  sphinx-fortran==1.0.1 \
  numpy \
  recommonmark

CMD ["/bin/bash"]

WORKDIR /work

RUN wget https://github.com/aNiemack/sphinx-git/blob/master/conversion.sh
RUN chmod 0755 conversion.sh
