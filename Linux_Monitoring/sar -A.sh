#!/bin/bash

cd kSar-5.0.6/
LC_ALL=C sar -A -f /var/log/sa/sa05 > /root/sa05.txt
java -jar kSar.jar
