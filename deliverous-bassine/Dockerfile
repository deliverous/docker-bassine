FROM deliverous/docker-bassine

RUN apt-get update \
 && apt-get install -y \
      qt4-dev-tools \
      qt4-qmake \
      ruby \
      golang \
      vim-gocomplete \
      gocode-auto-complete-el \
      jekyll \
 && apt-get clean \
 && gem install bundle

USER pierre
RUN echo "[ -f ~/workspace/bin/env.sh ] && source ~/workspace/bin/env.sh" >> /home/pierre/.bashrc

RUN vim-addon-manager install go-syntax dockerfile

USER root

ADD get-deliverous /usr/local/bin/get-deliverous
RUN chmod 755 /usr/local/bin/get-deliverous

ADD authorized_keys /home/pierre/.ssh/authorized_keys
RUN chown -R pierre:pierre /home/pierre/ \
 && chmod 600 /home/pierre/.ssh/authorized_keys

RUN git clone https://github.com/mnagel/clustergit /usr/local/src/clustergit \
 && ln -s /usr/local/src/clustergit/clustergit /usr/local/bin/clustergit 
RUN git clone https://github.com/StreakyCobra/gws /usr/local/src/gws \
 && ln -s /usr/local/src/gws/src/gws /usr/local/bin/gws

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
