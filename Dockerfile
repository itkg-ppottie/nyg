FROM alpine:latest

LABEL maintenainer="Pierre Pottié <pierre.pottie@gmail.com>"

RUN apk add --no-cache nodejs-npm
RUN  rm -rf  /usr/share/man /tmp/* /var/cache/apk/* \
    /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
/usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts

RUN   npm update && \
      npm install --global gulp-cli && \
      npm install gulp gulp-sass

WORKDIR  /var/www

CMD ["gulp","watch"]