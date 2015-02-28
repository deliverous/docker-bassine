FROM registry.deliverous.net/deliverous/docker-bassine:0.1.0-0

ENV GOVERSION 1.4.2
ENV RUBYVERSION 2.1.5

RUN apt-add-repository -y ppa:brightbox/ruby-ng \
 && apt-get update \
 && apt-get install -y qt4-dev-tools qt4-qmake ruby2.1 \
 && apt-get clean \
 && gem install bundle

RUN curl -sSL https://storage.googleapis.com/golang/go$GOVERSION.linux-amd64.tar.gz  | tar -v -C /usr/local -xz

USER pierre
RUN echo "export PATH=/usr/local/go/bin:$PATH" >> /home/pierre/.bashrc \
 && echo "[ -f ~/workspace/bin/env.sh ] && source ~/workspace/bin/env.sh" >> /home/pierre/.bashrc

RUN vim-addon-manager install go-syntax dockerfile

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
