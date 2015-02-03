FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
        build-essential \
        byobu \
        ca-certificates \
        curl \
        git \
        mercurial \
        openssh-server \
        openssl \
        vim \
        vim-addon-manager \
        vim-nox \
	vim-scripts \
	vim-syntax-docker \
	vim-syntax-go

RUN \
    adduser --disabled-login --gecos "Pierre D'eau,,," pierre \
    && (echo "pierre:deau" | chpasswd) \
    && adduser pierre sudo

ADD gitconfig /home/pierre/.gitconfig
ADD vimrc /home/pierre/.vimrc
ADD set-git-user /usr/local/bin/set-git-user
RUN \
    chmod 755 /usr/local/bin/set-git-user \
    && chown -R pierre:pierre /home/pierre

RUN \
    mkdir /var/run/sshd \
    && echo 'root:root' | chpasswd \
    && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
