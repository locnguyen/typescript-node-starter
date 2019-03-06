FROM node:10-alpine as base

LABEL maintainer Loc Nguyen <loc@productionpoint.io>

RUN apk update \
    && apk add --no-cache \
    bash

ARG HOST_UID=${HOST_UID:-4000}
ARG HOST_USER=${HOST_USER:-nodummy}
ARG PROJECT_NAME=${PROJECT_NAME}

RUN [ "${HOST_USER}" == "root" ] || \
    (adduser -h /home/${HOST_USER} -D -u ${HOST_UID} ${HOST_USER} \
&& chown -R "${HOST_UID}:${HOST_UID}" /home/${HOST_USER})

USER ${HOST_USER}

WORKDIR /home/${HOST_USER}

# Make a directory for our app and copy package.json there
RUN mkdir -p /home/${HOST_USER}/${PROJECT_NAME}
WORKDIR /home/${HOST_USER}/${PROJECT_NAME}
COPY package*.json ./
COPY bootstrap.js .
COPY tsconfig.json .

# Build intermediate image with dependencies
FROM base AS dependencies

RUN npm set progress=false && npm config set depth 0
RUN npm install --only=production
RUN cp -R node_modules prod_node_modules
RUN npm install


# Build the TypeScript application
FROM dependencies AS build
COPY . .
RUN npm run build --production


# Create a release image w/o devDependencies
FROM base AS release

ARG HOST_USER=${HOST_USER:-nodummy}
ARG PROJECT_NAME=${PROJECT_NAME}

USER ${HOST_USER}

COPY --from=dependencies /home/${HOST_USER}/${PROJECT_NAME}/prod_node_modules ./node_modules
COPY --from=build /home/${HOST_USER}/${PROJECT_NAME}/build ./build
EXPOSE 8080
CMD ["node", "-r", "./bootstrap.js", "build"]


# Create a development image with devDependencies
FROM node:10-alpine as dev

ARG HOST_UID=${HOST_UID:-4000}
ARG HOST_USER=${HOST_USER:-nodummy}
ARG PROJECT_NAME=${PROJECT_NAME}

RUN [ "${HOST_USER}" == "root" ] || \
    (adduser -h /home/${HOST_USER} -D -u ${HOST_UID} ${HOST_USER} \
&& chown -R "${HOST_UID}:${HOST_UID}" /home/${HOST_USER})

USER ${HOST_USER}

COPY --from=build /home/${HOST_USER}/${PROJECT_NAME} /home/${HOST_USER}/${PROJECT_NAME}
WORKDIR /home/${HOST_USER}/${PROJECT_NAME}
CMD ["npm", "run", "dev"]