#!/bin/bash

# Set volume to 80%
amixer -D pulse sset Master 80%

# Buzzer script for alarm.sh

# Launch Firefox with Deutshlandfunk livestream
firefox https://st01.sslstream.dlf.de/dlf/01/128/mp3/stream.mp3?aggregator=web

