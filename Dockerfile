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

RUN git clone https://github.com/aNiemack/sphinx-git 
RUN cd sphinx-git;
    mv conversion.sh /work;
    cd ..;
    rm -r sphinx-git
RUN chmod 0755 conversion.sh
