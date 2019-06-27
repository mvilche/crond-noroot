#!/bin/sh
set -e
echo "···································································································"
echo "MARTIN FABRIZZIO VILCHE - https://github.com/mvilche"
echo "···································································································"
APP_NAME=GO-CROND

if [ ! -s /opt/custom_tasks/tasks ]; then

if [ ! -O /opt/custom_tasks/tasks ]; then
  echo "···································································································"
  echo "PERMISO DENEGADO AL ACCEDER AL ARCHIVO DE TASKS"
  echo "SI ESTA UTILIZANDO EL ARCHIVO DESDE UN CONFIGMAP O VOLUMEN, EL MISMO NO PUEDE ESTAR VACIO"
  exit 1
  echo "···································································································"
fi
echo "···································································································"
echo "NO SE ENCONTRO ARCHIVO TASKS - USANDO POR DEFECTO.."
echo "···································································································"
echo ""
cat << EOF > /usr/share/crond/tasks
# EJEMPLO DE TASKS

SHELL=/bin/sh

* * * * * 1001 sleep 5 && id >> /tmp/test-1

#dia(*) hora(*) dia_del_mes(*) mes(*) dia_semana(*) id_usuario(1001) commando(sleep 5 && id >> /tmp/test-1)

EOF
cat /usr/share/crond/tasks
echo "···································································································"
else
echo "···································································································"
echo "ARCHIVO TASKS ENCONTRADO..."
cat /opt/custom_tasks/tasks > /usr/share/crond/tasks
echo ""
cat /usr/share/crond/tasks
echo "···································································································"
fi




if [ -z "$TIMEZONE" ]; then
echo "···································································································"
echo "VARIABLE TIMEZONE NO SETEADA - INICIANDO CON VALORES POR DEFECTO"
echo "POSIBLES VALORES: America/Montevideo | America/El_Salvador"
echo "···································································································"
else
echo "···································································································"
echo "TIMEZONE SETEADO ENCONTRADO: " $TIMEZONE
echo "···································································································"
cat /usr/share/zoneinfo/$TIMEZONE > /etc/localtime && \
echo $TIMEZONE > /etc/timezone
fi


echo "INICIANDO $APP_NAME...."
sleep 5s
exec go-crond --allow-unprivileged --no-auto --default-user=1001 --verbose "$@"
