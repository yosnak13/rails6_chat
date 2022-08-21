FROM node:12.18.3-alpine

ENV APP_HOME /rails6-chat-fe
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN apk update && npm install -g @vue/cli
COPY ./frontend/package.json $APP_HOME
RUN npm install