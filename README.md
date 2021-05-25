# cncjs in arm64 docker image

## Quick start

```bash
docker volume create cncjs
docker pull urpylka/cncjs:latest
docker run -d --device=/dev/ttyACM0 --cap-add=SYS_RAWIO -v "cncjs:/config" -p 80:80 --restart unless-stopped --name cncjs urpylka/cncjs:latest
```

## UART Wi-Fi bridge

It can be made with `ESP8266`. For doing that use [esp-link](https://github.com/jeelabs/esp-link).
To do virtual serial interface can be used `socat`.

```bash
socat pty,link=/dev/ttyAMA2,raw,echo=0 tcp:IP_OF_ESP8266:23
```

`link=/dev/ttyAMA2` – doesn't work with some paths at macOS.

To throw intarface to docker container use `-v /dev/ttyAMA2:/dev/ttyAMA2`, `--device /dev/ttyAMA2` – doesn't work.

## Notes

It cannot be installed to `alpine` by `npm install` or builded there by `node`.

## References

* https://cnc.js.org
* https://github.com/cncjs/cncjs
* https://github.com/balena-io-playground/balena-cncjs
* https://www.balena.io/blog/add-new-functionality-to-affordable-cnc-machines-using-cnc-js-and-balena/
