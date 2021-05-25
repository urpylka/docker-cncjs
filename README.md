# cncjs in arm64 docker image

Supervisor runs inside the image with two processes: `cncjs` & `socat`. `socat` creates virtual serial interface from esplink brige. You need just set up `ESPLINK_HOST` variable.

## Quick start

```bash
docker run -d -e ESPLINK_HOST=192.168.11.204 -v "cncjs:/config" -p 80:80 --restart unless-stopped --name cncjs urpylka/cncjs:socat
```

Where `192.168.11.204` is IP of your ESP LINK device.

## Hardware

It can be made with an `ESP8266` chip. For doing it use [esp-link](https://github.com/jeelabs/esp-link).

## Notes

It cannot be installed to `alpine` by `npm install` or builded there by `node`.

## References

* https://cnc.js.org
* https://github.com/cncjs/cncjs
* https://github.com/balena-io-playground/balena-cncjs
* https://www.balena.io/blog/add-new-functionality-to-affordable-cnc-machines-using-cnc-js-and-balena/
