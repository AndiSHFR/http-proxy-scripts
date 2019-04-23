#!/bin/sh
#
# https://stackoverflow.com/questions/783811/getting-git-to-work-with-a-proxy-server
#
PROXY_URL=http://proxy.corporate.lan:8080
#
echo GIT proxy support script.
# git config --global --get http.proxy
#
case "$1" in 
    [Oo][Nn])
	echo Enabling proxy for ${PROXY_URL}.
	git config --global http.proxy ${PROXY_URL}
	git config --global https.proxy ${PROXY_URL}
	;;

    [Oo][Ff][Ff])
	echo Disabling proxy support.
	git config --global --unset http.proxy
	git config --global --unset https.proxy
	;;

    *)
	echo Please supply argument ON or OFF to turn poxy support on or off.
	echo Usage: $0 "ON|OFF"
	echo Example: $0 ON
	;;

esac
#
