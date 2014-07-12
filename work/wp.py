import os
import random

def list():
  options = []
  fp = open("list.txt", "r")

  string = fp.readline().rstrip()
  while (string):
    options.append(string)
    string = fp.readline().rstrip()

  return options

def choose(options_list):
  i = 1

  print "which wallpaper do you want?"
  for option in options_list:
    print "  {}. {}".format(i, option)
    i += 1

  answer = int(input("answer: "))
  if answer is 0:
    exit()
  elif answer > len(options_list):
    option = random.choice(options_list)
    #option = options_list[answer]
  else:
    option = options_list[answer-1]

  return option

def change(path):
  os.system("feh --bg-fill {}".format(path))

change(choose(list()))
