FROM alpine:latest
RUN apk add socat
ENV IP_OF_ESP8266=127.0.0.1
CMD socat pty,link=/serialport/tty.esplink,raw,echo=0 tcp:${IP_OF_ESP8266}:23
