FROM node:wheezy

MAINTAINER Loc Nguyen <loc@productionpoint.io>

# Install the usual Linux stuff
RUN apt-get update &&  \
    apt-get install -y curl g++ gcc git make sudo wget && \
    apt-get -y autoclean

RUN npm install -g typescript@2.2.2 \
    typings@2.1.1 \
    tslint@4.2.0 \
    ts-node \
    nodemon