cd ~/desktop
{
  find wp/*.jpg
  find wp/*.png
} > list.txt
python2 scripts/work/auto_wp.py
rm list.txt
