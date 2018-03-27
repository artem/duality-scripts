#!/vendor/bin/sh
# *********************************************************************
# * Copyright 2016 (C) Sony Mobile Communications Inc.                *
# * All rights, including trade secret rights, reserved.              *
# *********************************************************************
#

# set cpu_boost parameters
echo "80" > /sys/module/cpu_boost/parameters/input_boost_ms
echo 9 > /proc/sys/kernel/sched_upmigrate_min_nice

exit 0
