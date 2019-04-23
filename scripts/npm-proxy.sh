#!/bin/sh
#
#
PROXY_URL=http://proxy.corporate.lan:8080
#
echo NPM proxy support script.
#
case "$1" in 
    [Oo][Nn])
	echo Enabling proxy for ${PROXY_URL}.
	npm config set proxy ${PROXY_URL}
	npm config set https-proxy ${PROXY_URL}
	;;

    [Oo][Ff][Ff])
	echo Disabling proxy support.
	npm config delete proxy
	npm config delete https-proxy
	;;

    *)
	echo Please supply argument ON or OFF to turn poxy support on or off.
	echo Usage: $0 "ON|OFF"
	echo Example: $0 ON
	;;

esac
#
