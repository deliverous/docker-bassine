FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

ENV GOVERSION 1.3.3
ENV RUBYVERSION 2.1.5

RUN \
    apt-get update \
    && apt-get dist-upgrade -y
RUN \
    apt-get install -y --no-install-recommends \
        curl \
        build-essential \
        openssh-server \
        git \
        byobu

RUN \
    curl -sSL https://golang.org/dl/go$GOVERSION.src.tar.gz  | tar -v -C /usr/src -xz \
    && cd /usr/src/go/src && ./make.bash --no-clean

RUN \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 \
    && \curl -sSL https://get.rvm.io | bash -s stable \
    && source /etc/profile.d/rvm.sh \
    && rvm install ruby-$RUBYVERSION \
    && rvm use ruby-$RUBYVERSION

RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir -p /workspace



EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]



 apt-get upgrade
  16  mkdir wc
  17  cd wc/
  27  . /usr/bin/byobu-reconnect-sockets
  28  git clone git@git.deliverous.com:deliverous/workspace deliverous
  30  cd deliverous/
  43  bundle
  46  bundle exec rake git:update
  48  source ./bin/env.sh
  49  cd gocode/src/
  51  cd git.deliverous.com/
  53  cd deliverous/api.git/
  56  export PATH=/usr/src/go/bin:$PATH
  60  go get -t ./...
  62  go test ./...
