#!/bin/bash

todaydate=$(date +'%d/%m/%Y')

git add .
git commit -m "${todaydate}"
git push