#!/bin/sh

set -e

. /etc/default/elowbatt

if [ x"$ACTION" = x"change" \
	   -a x"$POWER_SUPPLY_TYPE" = x"Battery" \
	   -a x"$POWER_SUPPLY_STATUS" = x"Discharging" \
	   -a $POWER_SUPPLY_CHARGE -le $CHARGE_LEVEL_ALARM ]
then
	uk-send elowbatt "LOWBATT"
fi
