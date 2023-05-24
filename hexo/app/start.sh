#! /bin/bash

hexo clean
hexo g

cp -r ./source/_pages ./public/tools

hexo s

