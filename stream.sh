#!/bin/bash
file=$1

bitrate=`ffprobe -v error -show_format $file | grep bit_rate | cut -d "=" -f 2 | awk '{ print int($1/1000)}'`
bufsize=$((${bitrate}*2))

ffmpeg -nostats -loglevel 0 -re -stream_loop -1 -i $file -c:v libx264 -vf format=yuv420p -b:v ${bitrate}k -bufsize ${bufsize}k -maxrate ${bitrate}k  -c:a aac -f flv "rtmp://localhost/show/stream"
