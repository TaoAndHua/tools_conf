#/bin/bash

vncserver -kill :1
vncserver -kill :2

vncserver -geometry 1920x1080 -depth 24

