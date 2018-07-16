FROM node:8

WORKDIR "/app"

COPY package.json /app/
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/local/bin/jq
RUN chmod a+x /usr/local/bin/jq

RUN npm install
RUN npm -g install bower
RUN bower install  --allow-root install --force

ADD . /app

ENV NODE_ENV production
ENV PORT 3000

EXPOSE 3000
CMD ["npm", "start"]

