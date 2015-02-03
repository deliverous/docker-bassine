FROM deliverous/docker-bassine:0.1.0-0

ENV GOVERSION 1.3.3
ENV RUBYVERSION 2.1.5

RUN \
    curl -sSL https://golang.org/dl/go$GOVERSION.src.tar.gz  | tar -v -C /usr/src -xz \
    && cd /usr/src/go/src && ./make.bash --no-clean

USER pierre

RUN \
    mkdir -p ~/workspace \
    && gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 \
    && \curl -sSL https://get.rvm.io | bash -s stable \
    && /home/pierre/.rvm/bin/rvm install ruby-$RUBYVERSION \
    && /home/pierre/.rvm/bin/rvm use ruby-$RUBYVERSION

CMD ["/usr/sbin/sshd", "-D"]
