#!/usr/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

cpu_temp=$(sensors | grep "Package id 0:" | tr -d '+' | awk '{print $4}')

echo "${cpu_temp}"
