### http file download

step1.创建 ./books 并将文件移至改目录
<br>
step2 : 创建 docker-compose.yml
```yml
version: '3'
services:
  file-http:
    image: sunkezheng/file-http:latest
    container_name: file-http
    volumes:
      - ./books:/root/books
    ports:
      - 80:80
```
step3 : docker-compose up
<br>
step4 : 同居局域网其他设备访问 http://{docker 所在主机 ip}