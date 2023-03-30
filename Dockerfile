FROM node:16-alpine

ENV UID=1000
ENV GID=1000

RUN deluser --remove-home node && \
    addgroup -g $GID foundry && \
    adduser -u $UID -G foundry -D foundry

USER foundry
RUN mkdir -p /home/foundry/data && mkdir -p /home/foundry/app

WORKDIR /home/foundry/app
COPY . .

USER root
RUN chown foundry /home/foundry/app/* -R

USER foundry

EXPOSE 30000
CMD ["node", "./resources/app/main.js", "--headless", "--dataPath=/home/foundry/data" ]
