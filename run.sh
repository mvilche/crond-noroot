#!/bin/bash

set -e
echo '···································································································'
echo 'MARTIN FABRIZZIO VILCHE - https://github.com/mvilche'
echo '···································································································'
APP_NAME=GO-CROND
cat << EOF > /tmp/example_tasks
# EJEMPLO DE TASKS
SHELL=/bin/sh
* * * * * 1001 sleep 5 && id >> /tmp/test-1
#dia(*) hora(*) dia_del_mes(*) mes(*) dia_semana(*) id_usuario(1001) commando(sleep 5 && id >> /tmp/test-1)
EOF
cat /tmp/example_tasks
echo '···································································································'
echo 'AGREGUE SUS TAREAS PROGRAMADAS A /usr/share/crond/ CON EL FORMATO MOSTRADO EN EL EJEMPLO'
echo '···································································································'
if [ -z '$TIMEZONE' ]; then
echo '···································································································'
echo 'VARIABLE TIMEZONE NO SETEADA - INICIANDO CON VALORES POR DEFECTO'
echo 'POSIBLES VALORES: America/Montevideo | America/El_Salvador'
echo '···································································································'
else
echo '···································································································'
echo 'TIMEZONE SETEADO ENCONTRADO: ' $TIMEZONE
echo '···································································································'
cat /usr/share/zoneinfo/$TIMEZONE > /etc/localtime && \
echo $TIMEZONE > /etc/timezone
fi
echo 'INICIANDO $APP_NAME....'
sleep 5s
exec go-crond --allow-unprivileged --no-auto --verbose --include=/usr/share/crond