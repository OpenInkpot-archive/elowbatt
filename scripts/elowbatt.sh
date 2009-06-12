#!/bin/sh

#set -e

. /etc/default/elowbatt

if [ x"$ACTION" = x"change" \
	   -a x"$POWER_SUPPLY_TYPE" = x"Battery" \
	   -a x"$POWER_SUPPLY_STATUS" = x"Discharging" \
	   -a 0"$POWER_SUPPLY_CHARGE_NOW" -le 0"$CHARGE_LEVEL_ALARM" ]	 
then
	uk-send elowbatt "LOWBATT"
fi
