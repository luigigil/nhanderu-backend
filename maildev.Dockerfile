FROM node:16.18.0

RUN yarn global add maildev@2.0.5

CMD maildev
