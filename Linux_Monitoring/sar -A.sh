#!/bin/bash
LC_ALL=C sar -A -f /var/log/sa/sa05 > /root/sa05.txt
