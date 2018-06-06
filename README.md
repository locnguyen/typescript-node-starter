# typescript-node-starter

[![Build Status](https://travis-ci.org/locnguyen/typescript-node-starter.svg?branch=master)](https://travis-ci.org/locnguyen/typescript-node-starter)

Barebones starter kit for server apps with TypeScript

## Quick Start

Install Node dependencies

```shell
$ npm install
```

Run the test suite

```shell
$ npm t
```

Run the code for development and watch for changes

```shell
$ npm run dev
```

Compile the code for release

```shell
$ npm run build
```

Run the compiled code

```shell
$ node -r ./bootstrap.js build
```

## Docker

If you want to develop in a Docker container, this project along with PostgreSQL can be brought up with

```shell
docker-compose up
```

See the **docker-compose.yml** file for details on this set up.