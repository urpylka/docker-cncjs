FROM registry.hub.docker.com/library/node:10.24.1-stretch as build
RUN apt update && apt install -y python3 g++ make
RUN npm install --unsafe-perm -g cncjs

FROM registry.hub.docker.com/library/node:10.24.1-stretch-slim
COPY --from=build /usr/local /usr/local
EXPOSE 8000
RUN mkdir /config
CMD /usr/local/bin/cncjs -H 0.0.0.0 -p 8000 -c /config/cncrc