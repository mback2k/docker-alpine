FROM alpine:latest

RUN apk --no-cache --update upgrade && apk --no-cache add findutils run-parts
RUN find /bin /sbin /usr/bin /usr/sbin /usr/local/bin -perm /a+s -type f -execdir chmod a-s {} +

ENV DOCKER_ENTRYPOINT_DIR /run/docker-entrypoint.d
ADD docker-entrypoint.sh /run/docker-entrypoint.sh

ENTRYPOINT ["/run/docker-entrypoint.sh"]
CMD ["/bin/bash"]
