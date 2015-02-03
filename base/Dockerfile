FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

ENV GOVERSION 1.3.3
ENV RUBYVERSION 2.1.5

RUN \
    apt-get update \
    && apt-get dist-upgrade -y

RUN \
    apt-get install -y \
        build-essential \
        byobu \
        ca-certificates \
        curl \
        git \
        mercurial \
        openssh-server \
        openssl \
        vim


RUN useradd user && (echo "user:user" | chpasswd) && adduser user sudo
RUN mkdir -p /home/user && chown -R user:user /home/user

RUN \
    curl -sSL https://golang.org/dl/go$GOVERSION.src.tar.gz  | tar -v -C /usr/src -xz \
    && cd /usr/src/go/src && ./make.bash --no-clean
    && gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 \
    && su - user -c "\curl -sSL https://get.rvm.io | bash -s stable "\
    && su - user -c "/usr/local/rvm/bin/rvm install ruby-$RUBYVERSION" \
    && su - user -c "/usr/local/rvm/bin/rvm use ruby-$RUBYVERSION"

RUN \
    mkdir /var/run/sshd \
    && echo 'root:root' | chpasswd \
    && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

ADD vimrc ~/.vimrc
RUN \
    su - user -c "mkdir -p ~/.vim/bundle" \
    && su - user -c "&& git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim" \
    && su - user -c "vim +PluginInstall +qall"

RUN su - user -c "mkdir -p ~/workspace"

ADD get-deliverous /usr/local/bin/get-deliverous
RUN chmod 755 /usr/local/bin/get-deliverous

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
