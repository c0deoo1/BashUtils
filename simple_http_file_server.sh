#!/bin/bash
PORT=""
if [ $# > 1 ] ; 
then
    PORT=$1
fi
python -m SimpleHTTPServer ${PORT}