#!/bin/sh

docker run                                                    \
       -e "ERL_SSH_PORT=22"                                   \
       -p 8091:8091                                           \
       -v `pwd`:/usr/local/tsung ddragosd/tsung-docker:latest \
       -f /usr/local/tsung/example.xml                        \
       start
