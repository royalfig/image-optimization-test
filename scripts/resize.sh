#!/bin/usr/env bash

mkdir responsive

cd responsive 

magick ./$1 -sampling-factor 4:2:0 -strip -quality 85 -interlace Plane -gaussian-blur 0.05 -colorspace RGB $1-responsive.jpg

#300
#500
#700
#900
#1100
#1300
#1500
#1700
#1900
#2100
