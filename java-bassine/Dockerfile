from deliverous/jessie
run apt-get update && \
    apt-get install -y x11vnc xvfb &&\
    apt-get clean
run apt-get update && \
    apt-get install -y openjdk-7-jdk eclipse maven &&\
    apt-get clean

run apt-get update && \
    apt-get install -y sudo &&\
    apt-get clean
run adduser --disabled-login --gecos "Pierre D'eau,,," pierre && \
    adduser pierre sudo

add sudoers /etc/sudoers
add gitconfig /home/pierre/.gitconfig
add set-git-user /usr/local/bin/set-git-user
run chmod 755 /usr/local/bin/set-git-user && \
    chmod 440 /etc/sudoers && \
    chown -R pierre:pierre /home/pierre

run apt-get update && \
    apt-get install -y ratpoison xterm &&\
    apt-get clean
user pierre
workdir /home/pierre
run mkdir ~/.vnc && x11vnc -storepasswd ooJ8ooH1mi ~/.vnc/passwd
env FD_PROG /usr/bin/ratpoison 
env X11VNC_FINDDISPLAY_ALWAYS_FAILS 1
env X11VNC_CREATE_GEOM 1280x768x16
expose 5900
cmd x11vnc -forever -usepw -create -shared
