#docker pull dorowu/ubuntu-desktop-lxde-vnc
FROM ubuntu:22.04

ENV http_proxy "http://child-prc.intel.com:913"
ENV HTTP_PROXY "http://child-prc.intel.com:913"
ENV https_proxy "http://child-prc.intel.com:913"
ENV HTTPS_PROXY "http://child-prc.intel.com:913"

ENV DEBIAN_FRONTEND=noninteractive
# install CoFluent
# RUN mkdir -p /home/cofluent && cd /home/cofluent && wget https://ubit-artifactory-sh.intel.com/artifactory/cofluent-local-sh-local/8.1.0/no_lic/IntelCoFluentStudio_v8.1.0_r1_nolic_linux64.tar.gz
# RUN tar axf IntelCoFluentStudio_v8.1.0_r1_nolic_linux64_no_install.tar.gz
# RUN rm -rf IntelCoFluentStudio_v8.1.0_r1_nolic_linux64_no_install.tar.gz

# install GCC/G++ 4.8.5 
# RUN bash -c 'echo "deb http://dk.archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list'
# RUN bash -c 'echo "deb http://dk.archive.ubuntu.com/ubuntu/ trusty-updates main universe" >> /etc/apt/sources.list'
# RUN  apt update && apt install -y gcc g++

# install Python pip
#RUN  wget https://bootstrap.pypa.io/get-pip.py

#RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt update && apt install -y ssh 

# Config sshd
RUN bash -c 'echo -e "123456\n123456" | passwd'
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN systemctl enable ssh
RUN service ssh restart

#install xrdp for remote access
#RUN apt update && apt install -y xrdp ubuntu-desktop vim cmake python3-pip
# RUN adduser xrdp ssl-cert
# RUN ufw allow from any to any port 3389 proto tcp
#RUN service xrdp restart
#Install Xfce:
RUN apt install -y xubuntu-desktop xrdp
RUN echo 5 | update-alternatives --config x-terminal-emulator
#RUN update-alternatives --config x-terminal-emulator
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











