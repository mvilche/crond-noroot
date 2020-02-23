#!/bin/bash

set -e
echo '···································································································'
echo 'MARTIN FABRIZZIO VILCHE - https://github.com/mvilche'
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
echo 'INICIANDO...'
exec /usr/bin/go-tasks --allow-unprivileged --no-auto --verbose --include=/opt/crontabs --configfile=/opt/config/config.ini