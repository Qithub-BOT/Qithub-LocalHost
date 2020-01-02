FROM keinos/alpine

RUN apk --no-cache add \
    autossh

# Default ENV variables (Do not quote the values)
ENV HOST_TARGET= \
    PORT_TARGET= \
    PORT_EXPOSE=80 \
    HOST_SSH_PORTFORWARD=ssh.localhost.run \
    SERVER_ALIVE_INTERVAL=30 \
    SERVER_ALIVE_COUNT_MAX=3 \
    AUTOSSH_LOGFILE=/root/autossh.log \
    URL_PREFIX=qithub

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
