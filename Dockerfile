FROM public.ecr.aws/docker/library/node:lts-hydrogen
RUN apt-get update && apt-get install git -y

WORKDIR /ecs-app

COPY package*.json ./
COPY controller controller
COPY server.js server.js

RUN npm install

ENV NODE_ENV=production
ENV ENV_ECS=true

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]