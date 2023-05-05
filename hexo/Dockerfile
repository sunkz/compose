FROM node:10.24.1

WORKDIR /app

COPY ./app .

RUN npm install &&\
    npm install -g hexo@4.2 &&\
    npm audit fix

ENTRYPOINT ["sh","start.sh"]