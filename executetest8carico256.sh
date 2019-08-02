#!/bin/bash

jmeter -n -t sampletest8carico256.jmx -l results.jtl

# Sleep for a few minutes to give pipeline time to retrieve dashboard files
sleep 900
