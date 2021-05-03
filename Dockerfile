FROM registry.hub.docker.com/library/node:10.24.1-stretch as build
RUN apt update && apt install -y python3 g++ make
RUN npm install --unsafe-perm -g cncjs@1.9.22

FROM registry.hub.docker.com/library/node:10.24.1-stretch-slim
COPY --from=build /usr/local /usr/local
RUN apt update && apt install -y udev && apt clean
EXPOSE 80
RUN mkdir /config
CMD /usr/local/bin/cncjs -H 0.0.0.0 -p 80 -c /config/cncrc
