FROM kalilinux/kali-linux-docker

RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free\
deb http://security.debian.org/ stretch/updates main" >> /etc/apt/sources.list

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean

RUN apt-get -y install firefox-esr kali-linux-top10 set dnsutils gpa gnupg2 hashcat

RUN rm -rf /usr/bin/burpsuite

RUN wget -O /burpsuite "https://portswigger.net/burp/releases/download?product=community&version=2.1.02&type=jar" && echo "java -jar /burpsuite" > /bin/burpsuite

COPY on_run.sh . && chmod +x on_run.sh

RUN echo "firefox-esr" > /bin/firefox