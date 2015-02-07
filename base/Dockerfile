FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update \
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
    && locale-gen en_US.UTF-8 fr_FR.UTF-8

RUN \
    adduser --disabled-login --gecos "Pierre D'eau,,," pierre \
    && adduser pierre sudo \
    && sed -ri 's/^%sudo\s+.*/%sudo  ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers \
    \
    && mkdir /var/run/sshd \
    && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM\s+.*/UsePAM no/g' /etc/ssh/sshd_config \
    && sed -ri 's/ChallengeResponseAuthentication\s+.*/ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config \
    && sed -ri 's/PasswordAuthentication\s+.*/PasswordAuthentication no/g' /etc/ssh/sshd_config \
    && echo "AllowUsers pierre" >> /etc/ssh/sshd_config

ADD gitconfig /home/pierre/.gitconfig
ADD vimrc /home/pierre/.vimrc
ADD set-git-user /usr/local/bin/set-git-user
RUN chmod 755 /usr/local/bin/set-git-user

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
