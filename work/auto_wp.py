import os
import random

def list():
  options = []
  fp = open('list.txt', 'r')

  string = fp.readline().rstrip()
  while (string):
    options.append(string)
    string = fp.readline().rstrip()

  return options

def choose(options_list):
  return random.choice(options_list)

def change(path):
  os.system('feh --bg-fill {}'.format(path))

change(choose(list()))
