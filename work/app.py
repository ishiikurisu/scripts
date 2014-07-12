import json
import os

def decoder(input_file):
  fp = open(input_file, "r")
  info = json.loads(fp.read())
  return info

def choose(options):
  possibilities = []
  i = 1

  print "which one do you want?"
  for possibility in options:
    print("  {}. {}".format(i, possibility))
    possibilities.append(possibility)
    i += 1
  answer = int(input("answer: "))

  if answer is 0 or answer > len(possibilities):
    exit()
  else:
    return options[possibilities[answer-1]]

def launch(app):
  os.system("{}".format(app))

launch(choose(decoder("app.json")))
