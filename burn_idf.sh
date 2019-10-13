#!/bin/bash

source burn_env.sh

source ${BURN_IDF_PATH}/export.sh

set -ex

idf.py build

ssh -p ${BURN_SSH_PORT} ${BURN_SSH_USER}@${BURN_SSH_IP} "cd /home/pi && ./gpio_dl_mode_on.sh && ./gpio_off_on.sh"

idf.py -p ${BURN_UART} flash

nohup sleep 2 && ssh -p ${BURN_SSH_PORT} ${BURN_SSH_USER}@${BURN_SSH_IP} "cd /home/pi && ./gpio_dl_mode_off.sh && ./gpio_off_on.sh" &

picocom -b ${BURN_BAUD_RATE} ${BURN_UART}

