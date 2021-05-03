# cncjs in arm64 docker image

## Quick start

```bash
docker volume create cncjs
docker pull urpylka/cncjs:latest
docker run -d --device="/dev/ttyUSB0:/dev/ttyUSB0" --cap-add=SYS_RAWIO -v "cncjs:/config" -p 80:8000 urpylka/cncjs:latest
```

## Notes

It cannot be installed to `alpine` by `npm install` or builded there by `node`.

## References

* https://github.com/balena-io-playground/balena-cncjs
* https://www.balena.io/blog/add-new-functionality-to-affordable-cnc-machines-using-cnc-js-and-balena/
* https://cnc.js.org
* https://github.com/cncjs/cncjs
