#!/bin/sh
ping -c 1 13.107.246.1 | grep -oP '(?<=time=)[0-9.]+'
