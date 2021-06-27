#!/bin/bash
#
#script to install and condigure git and github account login
#
sudo apt install git
git clone https://github.com/aviramboo/bash-scripts.git
git config --global user.name "aviram booxbaum"
git config --global user.email "aviram.booxbaum@gmail.com"
git status
git add <file or . for all files in directory
git commit -m "message" <file or . for all files in directory>
git push origin main .
