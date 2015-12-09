#!/usr/bin/python
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
