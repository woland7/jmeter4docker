#!/bin/bash

jmeter -n -t $1 -l results.jtl

# Sleep for a few minutes to give pipeline time to retrieve dashboard files
sleep 900