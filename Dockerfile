FROM ghcr.io/siwatinc/siwat-ubuntubaseimage:hirsute
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && apt-get -y install openjdk-16-jdk
RUN curl --output /usr/share/keyrings/nginx-keyring.gpg https://unit.nginx.org/keys/nginx-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/nginx-keyring.gpg] https://packages.nginx.org/unit/ubuntu/ hirsute unit" > /etc/apt/sources.list.d/unit.list && \
    echo "deb-src [signed-by=/usr/share/keyrings/nginx-keyring.gpg] https://packages.nginx.org/unit/ubuntu/ hirsute unit" >> /etc/apt/sources.list.d/unit.list
RUN apt-get -y update && apt-get -y install openjdk-17-jre unit unit-jsc16
RUN mkdir -p /software/unit
ADD ./unit.json /software/unit/config.json
ADD ./entrypoint.sh /software/entrypoint.sh
RUN chmod +x /software/entrypoint.sh
WORKDIR /config
CMD /software/entrypoint.sh