### step1 : 创建 broker.conf : ./datadir/broker/broker.conf
```properties
brokerClusterName = DefaultCluster
brokerName = broker-a
brokerId = 0
# IP 为本机 IP  ifconfig
brokerIP1 = 10.115.120.23
deleteWhen = 04
fileReservedTime = 48
brokerRole = ASYNC_MASTER
flushDiskType = ASYNC_FLUSH
```
### step2 : 创建 docker-compose.yml
```yaml
version: '3'
services:
  namesrv:
    image: apacherocketmq/rocketmq
    container_name: namesrv
    ports:
    - 9876:9876
    volumes:
    - ./datadir/namesrv/logs:/home/rocketmq/logs
    command: sh mqnamesrv
  broker:
    image: apacherocketmq/rocketmq
    container_name: rmqbroker
    ports:
    - 10909:10909
    - 10911:10911
    - 10912:10912
    volumes:
    - ./datadir/broker/logs:/home/rocketmq/logs
    - ./datadir/broker/store:/home/rocketmq/store
    - ./datadir/broker/broker.conf:/home/rocketmq/rocketmq-4.6.0/conf/broker.conf
    command: sh mqbroker -n namesrv:9876 -c ../conf/broker.conf
    depends_on:
    - namesrv
  rmqconsole:
    image: styletang/rocketmq-console-ng
    container_name: rmqconsole
    ports:
    - 8080:8080
    environment:
      JAVA_OPTS: -Drocketmq.namesrv.addr=namesrv:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false
    depends_on:
    - namesrv
```
### step3 : docker-compose up -d  &  docker-compose down

### step4 : localhost:8082/

### RocketMQ-Spring-Boot-Starter
https://github.com/apache/rocketmq-spring/wiki

