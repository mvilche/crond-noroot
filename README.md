# CROND NON ROOT ALPINE - DOCKER IMAGE

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


## Detalles

- Non root container
- Openshift ready!
- Run with 1001 user id



## Definir crontab

Para definir un archivo de crontab utilice un volumen, configs o configmap.

/opt/crond/crontab


### Ejemplo de crontab

```bash

SHELL=/bin/sh
* * * * * 1001 sleep 5 && id >> /tmp/test-1
```
El servicio de cron es ejecutado con el usuario id 1001.


## Iniciar servicios

```bash

docker-compose up

```

## License
Martin Fabrizzio Vilche
