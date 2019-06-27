# CROND NON ROOT ALPINE - DOCKER IMAGE

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


## Detalles

- Non root container
- Openshift ready!
- Run with 1001 user id



## Definir tasks

Para definir un archivo de tasks utilice un volumen, configs o configmap.

Genere un archivo "tasks" con las tareas programadas e integrelo utilizando los métodos mencionados

Ejemplo

```bash

docker run -d --name crond -v ./tasks:/opt/custom_tasks/tasks mvilche/crond-noroot:alpine3.9

```

### Ejemplo de archivo tasks

```bash
SHELL=/bin/sh
* * * * * 1001 sleep 5 && id >> /tmp/test-1
```
#####  El archivo task utiliza la syntaxis del cron de linux :

 ```bash
SHELL=/bin/sh
dia(*) hora(*) dia_del_mes(*) mes(*) dia_semana(*) id_usuario(1001) commando(sleep 5 && id >> /tmp/test-1)
```




## Iniciar servicios

```bash

docker-compose up

```

## License
Martin Fabrizzio Vilche
