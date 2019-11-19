#!/bin/bash
#author: Bartlomiej Cieszkowski <bartlomiej.cieszkowski@gmail.com>

if [[ -n "${BASH_SOURCE}" && ( "${BASH_SOURCE[0]}" == "${0}" ) ]]; then
	echo "This script should be sourced not executed"
	return 1
fi

export BURN_IDF_PATH=`dirname $0`/esp-idf
#export BURN_UART=/dev/ttyUSB0
#export BURN_UART="/dev/serial/by-path/pci-0000:00:14.0-usb-0:1.2.4:1.0-port0"
#export BURN_UART="/dev/serial/by-path/pci-0000\:00\:14.0-usb-0\:1.2.4\:1.0-port0"
export BURN_UART="/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_A92117B3-if00-port0"
export BURN_BAUD_RATE=115200
export BURN_SSH_PORT=22
export BURN_SSH_IP=192.168.1.201
export BURN_SSH_USER=pi

