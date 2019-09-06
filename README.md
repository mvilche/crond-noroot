# CROND NON ROOT ALPINE - DOCKER IMAGE

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


## Detalles

- Non root container
- Openshift ready!
- Configmap para el seteo de cron


### Ejemplo de archivo tasks

```bash
SHELL=/bin/bash
* * * * * 1001 sleep 5 && id >> /tmp/test-1
```
#####  El archivo task utiliza la syntaxis del cron de linux :

 ```bash
SHELL=/bin/bash
dia(*) hora(*) dia_del_mes(*) mes(*) dia_semana(*) usuario(crond) commando(sleep 5 && id >> /tmp/test-1)
```


## Iniciar servicios

```bash

oc create -f crond-noroot-template-openshift.yaml

```




## License
Martin Fabrizzio Vilche
