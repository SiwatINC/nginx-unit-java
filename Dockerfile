FROM nginx/unit:1.26.1-minimal
RUN apt-get -y update && apt-get -y install openjdk-17-jre
RUN mkdir -p /software/unit
ADD ./unit.json /software/unit/config.json
ADD ./entrypoint.sh /software/entrypoint.sh
RUN chmod +x /software/entrypoint.sh
WORKDIR /config
CMD ["/software/entrypoint.sh"]