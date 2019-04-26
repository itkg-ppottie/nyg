FROM alpine:latest

ARG HOST_USER_GID=1000
ARG HOST_USER_UID=1000
LABEL maintenainer="Pierre Pottié <pierre.pottie@gmail.com>"

RUN apk add --no-cache nodejs-npm python make g++
RUN  rm -rf  /usr/share/man /tmp/* /var/cache/apk/* \
    /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
/usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts
RUN set -ex                                                 && \
                                                               \
    echo 'Creating notroot user and group from host'        && \
    addgroup -g $HOST_USER_GID -S notroot                      && \
    adduser  -u $HOST_USER_UID -S notroot -G notroot

RUN   npm update && \
      npm install --global gulp-cli && \
      npm install gulp gulp-sass

RUN mkdir /.config && chown -R notroot: /.config
RUN  npm rebuild node-sass --force
WORKDIR  /var/www
USER notroot

CMD ["gulp","watch"]