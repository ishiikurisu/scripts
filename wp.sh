
cd ~/desktop
{
  find wp/*.jpg
  find wp/*.png
} > list.txt
python2 scripts/work/wp.py
rm list.txt
