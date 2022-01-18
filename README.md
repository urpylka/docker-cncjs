# docker-cncjs

This is based on Debian because it cannot be installed to `alpine` by `npm install` or builded there by `node`.

## Quick start

```bash
docker volume create cncjs
docker pull urpylka/cncjs:latest
docker run -d --device=/dev/ttyACM0 --cap-add=SYS_RAWIO -v "cncjs:/config" -p 80:80 --restart unless-stopped --name cncjs urpylka/cncjs:latest
```

> To throw interface to docker container use `-v /dev/ttyAMA2:/dev/ttyAMA2` (`--device /dev/ttyAMA2` doesn't work).

## UART Wi-Fi bridge

1. On CNC side it can be made with an `ESP8266` chip. For doing it use [esp-link](https://github.com/jeelabs/esp-link).
2. On CNCjs side define `ESPLINK` (fe 192.168.1.80:23), add use commands (`Start socat`, `Stop socat`, `pkill -f cncjs`) from `cncjs.json` to control it.

## References

* https://cnc.js.org
* https://github.com/cncjs/cncjs
* https://github.com/balena-io-playground/balena-cncjs
* https://www.balena.io/blog/add-new-functionality-to-affordable-cnc-machines-using-cnc-js-and-balena/
