FROM urpylka/cncjs:latest

RUN apt install -y supervisor socat

ENV ESPLINK_HOST=127.0.0.1

COPY ./cncjs.json /config/cncrc
ADD ./supervisord.conf /etc/supervisor/supervisord.conf
CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
