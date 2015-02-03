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
        vim-python \
	vim-ruby \
	vim-scripts \
	vim-syntax-docker \
	vim-syntax-go 

RUN \
    useradd johndeau \
    && (echo "johndeau:johndeau" | chpasswd) \
    && adduser johndeau sudo \
    && mkdir -p /home/johndeau \
    && chown -R johndeau:johndeau /home/johndeau

USER johndeau
RUN git config --global push.default simple
ADD vimrc /home/johndeau/.vimrc
RUN \
    mkdir -p ~/workspace ~/.vim/bundle \
    && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && vim +PluginInstall +qall

USER root

RUN \
    mkdir /var/run/sshd \
    && echo 'root:root' | chpasswd \
    && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
