#!/bin/bash
echo “=================================================================”
echo ”                             CPU                                 “
echo “=================================================================”
echo ””
echo “Hostname : $(hostname)”
echo “Date : $(date)”
echo “”
sar -u 1 5
Echo “”
