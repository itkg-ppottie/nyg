FROM alpine:3.7

LABEL maintenainer="Pierre Pottié <pierre.pottie@gmail.com>"

RUN apk add --no-cache nodejs-npm yarn
RUN  rm -rf  /usr/share/man /tmp/* /var/cache/apk/* \
    /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
/usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts

RUN yarn global add gulp --prefix /usr/local

WORKDIR  /var/www

CMD ["gulp","watch"]