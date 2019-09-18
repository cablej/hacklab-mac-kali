FROM kalilinux/kali-linux-docker

RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free\
deb http://security.debian.org/ stretch/updates main" >> /etc/apt/sources.list

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean

RUN apt-get -y install firefox-esr

RUN apt-get -y install kali-linux-top10

RUN apt-get -y install set

RUN apt-get -y install dnsutils

RUN apt-get -y install hashcat

RUN rm -rf /usr/bin/burpsuite

RUN wget -O /burpsuite "https://portswigger.net/burp/releases/download?product=community&version=2.1.02&type=jar" && echo "java -jar /burpsuite" > /bin/burpsuite

RUN chmod +x /bin/burpsuite

RUN apt-get -y install gpa gnupg2

COPY on_run.sh .

RUN chmod +x on_run.sh

RUN echo "firefox-esr" > /bin/firefox