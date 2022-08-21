FROM node:12.18.3-alpine

ENV APP_HOME /rails6-chat-fe
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME


# PJ作成時は下記コマンドのみで、COPY以降はPJ作成後に追加
# RUN apk update && npm install -g @vue/cli

RUN apk update
COPY ./frontend/package.json .
RUN npm install