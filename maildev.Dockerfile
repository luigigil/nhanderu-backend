FROM node:16.18.0

RUN yarn add -g maildev@2.0.5

CMD maildev
