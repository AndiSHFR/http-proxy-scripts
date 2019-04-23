#!/bin/sh
#
#
PROXY_URL=http://proxy.corporate.lan:8080
APT_CONFIGFILE_PROXY=/etc/apt/apt.conf.d/02-proxy-corporate
#
echo APT proxy support script.
#
case "$1" in 
    [Oo][Nn])
	echo Enabling proxy for ${PROXY_URL}.
        cat >${APT_CONFIGFILE_PROXY} <<EOT
# Set proxy server for apt
Acquire::http::proxy "${PROXY_URL}";
Acquire::https::proxy "${PROXY_URL}";
EOT
	;;

    [Oo][Ff][Ff])
	echo Disabling proxy support.
	[ -e "${APT_CONFIGFILE_PROXY}" ] && rm "${APT_CONFIGFILE_PROXY}" 
	;;

    *)
	echo Please supply argument ON or OFF to turn poxy support on or off.
	echo Usage: $0 "ON|OFF"
	echo Example: $0 ON
	;;

esac
#
