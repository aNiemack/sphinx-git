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
  pandoc

RUN pip install sphinx

RUN git clone https://github.com/VACUMM/sphinx-fortran.git && cd sphinx-fortran && python setup.py install

CMD ["/bin/bash"]

WORKDIR /work
