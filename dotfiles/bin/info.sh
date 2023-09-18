#!/usr/bin/env bash

echo "Disk usage:" $(sudo du -sh --block-size=1M /)
echo "Number active processes:" $(ps -e | wc -l)
echo "Number services:" $(systemctl list-units | wc -l)
