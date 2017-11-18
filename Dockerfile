FROM node:8.9.1-alpine

MAINTAINER Loc Nguyen <lochnguyen@gmail.com>

# Make a directory for our app and copy package.json there
RUN mkdir -p /home/app
WORKDIR /home/app
COPY package.json /home/app


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
COPY --from=dependencies /home/app/prod_node_modules ./node_modules
COPY --from=build /home/app/build ./build


EXPOSE 8080
CMD ["npm", "start"]