ARG ALPINE_IMAGE=alpine

FROM "${ALPINE_IMAGE}"

RUN apk --no-cache add \
    s6 \
    unbound

COPY /rootfs /

ENV CROND_ENABLED=yes \
    CROND_LOG_LEVEL=8 \
    ROOT_HINTS_UPDATE_SCHEDULE='0 5 1 * *'

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "s6-svscan", "/s6" ]
