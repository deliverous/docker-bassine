FROM deliverous/docker-bassine:0.1.0-0

ENV GOVERSION 1.3.3
ENV RUBYVERSION 2.1.5

RUN \
    curl -sSL https://golang.org/dl/go$GOVERSION.src.tar.gz  | tar -v -C /usr/src -xz \
    && cd /usr/src/go/src && ./make.bash --no-clean

USER pierre

RUN \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 \
    && \curl -sSL https://get.rvm.io | bash -s stable \
    && /bin/bash -l -c "rvm requirements" \
    && /bin/bash -l -c "rvm install ruby-$RUBYVERSION" \
    && /bin/bash -l -c "rvm use --default ruby-$RUBYVERSION"

USER root

ADD get-deliverous /usr/local/bin/get-deliverous
RUN chmod 755 /usr/local/bin/get-deliverous

VOLUME ["/home/pierre/workspace"]
CMD ["/usr/sbin/sshd", "-D"]
