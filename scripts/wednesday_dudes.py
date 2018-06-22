#!/usr/bin/python
import calendar
import datetime

now = datetime.datetime.now()

weekday = calendar.weekday(now.year, now.month, now.day)

if(weekday == 1):
    print("It's Wednesday, my dudes!")
