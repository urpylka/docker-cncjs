FROM registry.hub.docker.com/library/node:10.24.1-stretch as build
RUN apt update && apt install -y python3 g++ make
RUN npm install --unsafe-perm -g cncjs@1.9.23

FROM registry.hub.docker.com/library/node:10.24.1-stretch-slim
COPY --from=build /usr/local /usr/local
RUN apt update && apt install -y udev socat && apt clean

ENV ESPLINK=0.0.0.0:23
VOLUME /config
COPY cncjs.json /config/cncjs.json

EXPOSE 80
CMD /usr/local/bin/cncjs -H 0.0.0.0 -p 80 -c /config/cncjs.json
