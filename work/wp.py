import os
import random

def list():
  options = []
  fp = open("list.txt", "r")

  string = fp.readline().rstrip()
  while (string):
    options.append(string)
    string = fp.readline().rstrip()

  fp.close
  return options

def choose(options_list):
  newline = False
  i = 1

  print "which wallpaper do you want?"
  for option in options_list:
    print "* {}. {}".format(i, option),

    if len(option) <= 8:
      print "\t\t\t",
    elif len(option) <= 8*2:
      print "\t\t",
    else:
      print "\t",

    if newline is True:
      print "\n",

    newline = not newline
    i += 1

  #print "which wallpaper do you want?"
  #for option in options_list:
  #  print "  {}. {}".format(i, option),
  #  i += 1

  if newline is True:
    print(" ")
  answer = int(input("answer: "))
  if answer is 0:
    exit()
  elif answer > len(options_list):
    option = random.choice(options_list)
  else:
    option = options_list[answer-1]

  return option

def change(path):
  os.system("feh --bg-fill {}".format(path))

change(choose(list()))
