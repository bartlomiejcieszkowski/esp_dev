#!/bin/bash

SCRIPT_HOME=`dirname "$0"`
echo ${SCRIPT_HOME}

source ${SCRIPT_HOME}/burn_env.sh

source ${BURN_IDF_PATH}/export.sh

source ${BURN_IDF_PATH}/add_path.sh

START_DIR=`pwd`
if [ -z ${1+x} ]; then
	echo "Running in ${START_DIR}"
elif [ -d ${1} ]; then
	echo "Running in ${START_DIR}/${1}"
	cd ${START_DIR}/${1}
else
	echo "Invalid project directory"
	exit -1
fi

set -ex

idf.py build

ssh -p ${BURN_SSH_PORT} ${BURN_SSH_USER}@${BURN_SSH_IP} "cd /home/pi && ./gpio_dl_mode_on.sh && ./gpio_off_on.sh"

idf.py -p ${BURN_UART} flash

nohup sleep 2 && ssh -p ${BURN_SSH_PORT} ${BURN_SSH_USER}@${BURN_SSH_IP} "cd /home/pi && ./gpio_dl_mode_off.sh && ./gpio_off_on.sh" &

picocom -b ${BURN_BAUD_RATE} ${BURN_UART}

