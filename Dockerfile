FROM node:12-alpine

ENV UID=1000
ENV GUID=1000

RUN deluser node
RUN adduser -u $UID -D foundry

USER foundry
RUN mkdir -p /home/foundry/data
RUN mkdir -p /home/foundry/app

WORKDIR /home/foundry/app
COPY . .

USER root
RUN chown foundry /home/foundry/app/* -R

USER foundry

EXPOSE 30000
CMD ["node", "/home/foundry/app/resources/app/main.js", "--headless", "--dataPath=/home/foundry/data" ]
