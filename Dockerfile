FROM public.ecr.aws/bitnami/node:14.21.3-debian-11-r6
RUN apt-get update && apt-get install git -y && apt-get install imagemagick -y;

WORKDIR /ecs-app

COPY package*.json ./
COPY controller controller
COPY server.js server.js

RUN npm install

ENV NODE_ENV=production
ENV ENV_ECS=true

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]