#! /bin/bash
echo "Starting image compression... 🖼️"

mkdir assets
cd assets 

cp $1 .

filename=$(basename -- "$1")
filename="${filename%.*}"

params="-sampling-factor 4:2:0 -strip -quality 75 -interlace Plane"

echo "Working on resized and compressed"
magick $1 -resize 1500 $filename-resized.jpg
magick $1 $params $filename-compressed.jpg
magick $1 -resize 1500 $params $filename-resized-and-compressed.jpg
magick $1 $filename.avif
magick $1 $filename.webp

echo "Responsive image time"
magick $1 -resize 300 $params $filename-300.jpg
magick $1 -resize 500 $params $filename-500.jpg
magick $1 -resize 700 $params $filename-700.jpg
magick $1 -resize 900 $params $filename-900.jpg
magick $1 -resize 1100 $params $filename-1100.jpg
magick $1 -resize 1300 $params $filename-1300.jpg
magick $1 -resize 1500 $params $filename-1500.jpg
magick $1 -resize 1700 $params $filename-1700.jpg
magick $1 -resize 1900 $params $filename-1900.jpg
magick $1 -resize 2100 $params $filename-2100.jpg

magick $1 -resize 300 $filename-300.avif
magick $1 -resize 500 $filename-500.avif
magick $1 -resize 700 $filename-700.avif
magick $1 -resize 900 $filename-900.avif
magick $1 -resize 1100 $filename-1100.avif
magick $1 -resize 1300 $filename-1300.avif
magick $1 -resize 1500 $filename-1500.avif
magick $1 -resize 1700 $filename-1700.avif
magick $1 -resize 1900 $filename-1900.avif
magick $1 -resize 2100 $filename-2100.avif

magick $1 -resize 300 $filename-300.webp
magick $1 -resize 500 $filename-500.webp
magick $1 -resize 700 $filename-700.webp
magick $1 -resize 900 $filename-900.webp
magick $1 -resize 1100 $filename-1100.webp
magick $1 -resize 1300 $filename-1300.webp
magick $1 -resize 1500 $filename-1500.webp
magick $1 -resize 1700 $filename-1700.webp
magick $1 -resize 1900 $filename-1900.webp
magick $1 -resize 2100 $filename-2100.webp

echo "It's all done. Images resized, compressed, and converted."