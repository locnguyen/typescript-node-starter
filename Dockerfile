FROM node:8.2.1-alpine

MAINTAINER Loc Nguyen <lochnguyen@gmail.com>

RUN mkdir -p /home/app
WORKDIR /home/app

COPY package.json /home/app

RUN npm install -g -s --no-progress yarn && \
    yarn && \
    yarn run build && \
    yarn cache clean

COPY . /home/app