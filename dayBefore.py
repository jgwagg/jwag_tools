#!/usr/bin/python
# With no arguments, get the date of the previous workday
# I use this to find out when I left work yesterday and got to work today with the following command 
# in a cygwin bash shell on Windows
# wevtutil qe System /rd:true /f:text /c:1000 >/tmp/wev.out && less +/`~/bin/dayBefore.py` -j300 /tmp/wev.out
# 
# Also can give you the date of n number of days before today with "dayBefore.py n"
import sys
import time

if len(sys.argv) == 1:
	wday = time.localtime()[6]    # weekday w/ 0 == Monday
	if wday == 0:   
		numDays = 3   
	elif wday == 6:
		numDays = 2
	else:
		numDays = 1
else:
	numDays = int(sys.argv[1])

secs = time.time() - (60*60*24*numDays)
print time.strftime("%m-%d",time.localtime(secs))
