FROM debian:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  make \
  git-core \
  git-svn \
  subversion \
  libapache2-mod-svn \
  ruby \
  python-pip \
  python-dev \
  texlive texlive-latex-recommended \
  texlive-latex-extra \
  texlive-fonts-recommended
  
RUN \
apt-get update && \
apt-get install -y sudo curl git && \
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
sudo apt-get install git-lfs

RUN pip install Sphinx==1.4.4 sphinx_rtd_theme alabaster sphinx_bootstrap_theme

CMD ["/bin/bash"]

WORKDIR /doc
