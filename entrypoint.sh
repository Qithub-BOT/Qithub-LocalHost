#!/bin/sh

[ "${HOST_TARGET:+dummy}" ] || {
    echo '環境変数 HOST_TARGET が未定義もしくは空です。'
    exit 1
}

echo "${HOST_SSH_PORTFORWARD} の接続を ${HOST_TARGET}:${PORT_TARGET} にポートフォワーディングしています。"

rm -f ~/.ssh/known_hosts && \
autossh -M 0 \
    -t -t \
    -o ServerAliveInterval=$SERVER_ALIVE_INTERVAL \
    -o ServerAliveCountMax=$SERVER_ALIVE_COUNT_MAX \
    -o ExitOnForwardFailure=yes \
    -o StrictHostKeyChecking=accept-new \
    -R $PORT_EXPOSE:$HOST_TARGET:$PORT_TARGET \
    -l ${URL_PREFIX:-$HOSTNAME} \
    $HOST_SSH_PORTFORWARD
