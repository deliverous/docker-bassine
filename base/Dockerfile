FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install -y \
      vim-scripts \
      vim-syntax-docker \
      vim-syntax-go \
      build-essential \
      byobu \
      ca-certificates \
      curl \
      git \
      man \
      mercurial \
      openssh-server \
      openssl \
      time \
      vim \
      vim-addon-manager \
      vim-nox \
 && apt-get clean \
 && locale-gen en_US.UTF-8 fr_FR.UTF-8 \
 && mkdir /var/run/sshd

RUN adduser --disabled-login --gecos "Pierre D'eau,,," pierre \
 && adduser pierre sudo

ADD sshd_config /etc/ssh/sshd_config
ADD sudoers /etc/sudoers
ADD gitconfig /home/pierre/.gitconfig
ADD vimrc /home/pierre/.vimrc
ADD set-git-user /usr/local/bin/set-git-user

RUN chmod 755 /usr/local/bin/set-git-user \
 && chmod 440 /etc/sudoers
 && chown -R pierre:pierre /home/pierre

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
