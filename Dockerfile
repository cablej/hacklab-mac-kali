FROM kalilinux/kali-linux-docker

RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free\
deb http://security.debian.org/ stretch/updates main" >> /etc/apt/sources.list

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean

RUN apt-get -y install firefox-esr kali-linux-top10

COPY on_run.sh .


RUN echo "firefox-esr" > /bin/firefox