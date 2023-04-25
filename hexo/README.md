#### hexo + docker

docker-hub image : https://hub.docker.com/r/sunkezheng/hexo


step1.创建 ./_posts/blog.md
```md
---
title: title
author: author
date: 2018-01-01 00:10:00
---
content
```
step2 : 创建 docker-compose.yml
```yml
version: '3'
services:
  hexo:
    image: sunkezheng/hexo:latest
    container_name: hexo
    volumes:
      - ./_posts:/app/source/_posts
    ports:
      - 4000:4000
```
step3 : docker-compose up
<br><br>
step4 : http://localhost:4000
