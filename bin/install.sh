#!/usr/bin/env bash

if [ `which ruby` == "" ]; then
    printf "Ruby not found!" 1>&2
    exit 1
fi

gem install miasma
