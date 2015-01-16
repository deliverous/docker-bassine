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

RUN \
    curl -sSL https://golang.org/dl/go$GOVERSION.src.tar.gz  | tar -v -C /usr/src -xz \
    && cd /usr/src/go/src && ./make.bash --no-clean
    && gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 \
    && \curl -sSL https://get.rvm.io | bash -s stable \
    && /usr/local/rvm/bin/rvm install ruby-$RUBYVERSION \
    && /usr/local/rvm/bin/rvm use ruby-$RUBYVERSION

RUN \
    mkdir /var/run/sshd \
    && echo 'root:root' | chpasswd \
    && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir -p /workspace

ADD get-deliverous /usr/local/bin/get-deliverous
RUN chmod 755 /usr/local/bin/get-deliverous

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
