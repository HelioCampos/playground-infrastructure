#!/bin/sh

COMMON_CLASSPATH="`pwd`/default" ./gatling-bundle/bin/gatling.sh -s default.SampleApplicationLoadTest
