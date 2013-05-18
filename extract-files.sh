#!/bin/bash

export DEVICE=${PWD##*/}
export BOARDCONFIGVENDOR=false

../common/extract-files.sh $@

../common/setup-makefiles.sh
