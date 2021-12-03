#docker pull dorowu/ubuntu-desktop-lxde-vnc
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

#RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt update && apt install -y ssh 

# Config sshd
RUN bash -c 'echo -e "123456\n123456" | passwd'
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN systemctl enable ssh
RUN service ssh restart

#install Xfce-xrdp for remote access
# RUN adduser xrdp ssl-cert
# RUN ufw allow from any to any port 3389 proto tcp
RUN apt install -y xubuntu-desktop xrdp
RUN echo 5 | update-alternatives --config x-terminal-emulator
RUN echo xfce4-session > ~/.xsession
RUN sudo chown root:root  ~/.xsession
RUN systemctl enable xrdp
RUN service xrdp start

# Install vncserver
# RUN apt install -y tightvncserver expect
# RUN echo '#!/usr/bin/expect' >> /root/vncpasswdshell.sh
# RUN echo "set timeout 10" >> /root/vncpasswdshell.sh
# RUN echo "spawn vncpasswd" >> /root/vncpasswdshell.sh
# RUN echo "expect \"Password:\"" >> /root/vncpasswdshell.sh
# RUN echo "send \"123456\n\"" >> /root/vncpasswdshell.sh
# RUN echo "expect \"Verify:\"" >> /root/vncpasswdshell.sh
# RUN echo "send \"123456\n\"" >> /root/vncpasswdshell.sh
# RUN echo "expect \"Would you like to enter a view-only password (y/n)?\"" >> /root/vncpasswdshell.sh
# RUN echo "send \"n\n\"" >> /root/vncpasswdshell.sh
# RUN echo "interact" >> /root/vncpasswdshell.sh
# RUN chmod +x /root/vncpasswdshell.sh
# RUN /root/vncpasswdshell.sh

#Install Gnome:
# RUN apt update
# RUN apt install -y ubuntu-desktop