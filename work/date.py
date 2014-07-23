import os
import re

# creation of words
os.system('date > date.txt')
fp = open('date.txt', 'r')
words = fp.read().split()
fp.close()

# remotion of the hour part
hour = ''
for word in words:
  mo = re.search(r'\d+:\d+:\d+', word)
  if mo: hour = mo.group()

# change of name
hour = hour.split(':')
hour[0] = int(hour[0]) + 3
if hour[0] > 24:
  hour[0] = hour[0] - 24
hour[0] = str(hour[0])
new_hour = ''
for h in hour:
  new_hour = '{}{}:'.format(new_hour, h)
new_hour = new_hour.rstrip(':')

# construction of new hour
new_date = ''
for word in words:
  mo = re.search(r'\d+:\d+:\d+', word)
  if mo:
    new_date = '{} {}'.format(new_date, new_hour)
  else:
    new_date = '{} {}'.format(new_date, word)

# set up of new date
# print new_date.strip()
os.system('sudo date --set=\'{}\''.format(new_date))
