# typescript-node-starter

| Travis CI | GitLab CI |
| - | - |
| [![Build Status](https://travis-ci.org/locnguyen/typescript-node-starter.svg?branch=master)](https://travis-ci.org/locnguyen/typescript-node-starter) | [![pipeline status](https://gitlab.com/lochnguyen/typescript-node-starter/badges/master/pipeline.svg)](https://gitlab.com/lochnguyen/typescript-node-starter/commits/master) |

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

### Production Image

```shell
docker build --target release -t tsnodestarter:$(git rev-parse --short=7 HEAD) .
```