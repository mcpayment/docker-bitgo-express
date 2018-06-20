FROM alpine:3.6

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh nodejs nodejs-npm python python-dev py-pip build-base && \
    pip install virtualenv && \
    rm -rf /var/cache/apk/* && \
    mkdir bitgo-express && \
    cd bitgo-express && \
    npm install "bitgo"

ENV PATH="/bitgo-express/node_modules/bitgo/bin:$PATH" \

EXPOSE 3080

ENTRYPOINT ["bitgo-express"]
CMD ["--bind","0.0.0.0"]
