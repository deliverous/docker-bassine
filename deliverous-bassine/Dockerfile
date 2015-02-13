FROM registry.deliverous.net/deliverous/docker-bassine:0.1.0-0

ENV GOVERSION 1.3.3
ENV RUBYVERSION 2.1.5

RUN apt-get update \
 && apt-get install -y qt4-dev-tools qt4-qmake \
 && apt-get clean

RUN curl -sSL https://golang.org/dl/go$GOVERSION.src.tar.gz  | tar -v -C /usr/src -xz \
 && cd /usr/src/go/src && ./make.bash --no-clean

USER pierre

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 \
 && \curl -sSL https://get.rvm.io | bash -s stable \
 && /bin/bash -l -c "rvm requirements" \
 && /bin/bash -l -c "rvm install ruby-$RUBYVERSION" \
 && /bin/bash -l -c "rvm use --default ruby-$RUBYVERSION" \
 && /bin/bash -l -c "rvm rvmrc warning ignore allGemfiles"

USER root

ADD get-deliverous /usr/local/bin/get-deliverous
RUN chmod 755 /usr/local/bin/get-deliverous

ADD authorized_keys /home/pierre/.ssh/authorized_keys
RUN chown -R pierre:pierre /home/pierre/ \
 && chmod 600 /home/pierre/.ssh/authorized_keys

RUN git clone https://github.com/mnagel/clustergit /usr/local/src/clustergit \
 && ln -s /usr/local/src/clustergit/clustergit /usr/local/bin/clustergit

RUN apt-get install -y \
      libfreetype6-dev \
      libjpeg8-dev \
      liblcms2-dev \
      libtiff5-dev \
      libwebp-dev \
      python-pip \
      python-dev \
      python-tk \
      tcl8.6-dev \
      tk8.6-dev \
      zlib1g-dev \
 && pip install pelican Markdown Pillow

VOLUME ["/home/pierre/workspace", "/home/pierre/native"]
EXPOSE 22 8000
CMD ["/usr/sbin/sshd", "-D"]
