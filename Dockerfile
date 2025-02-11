FROM alpine:3.21.2
ARG version=1.37.0-r0
RUN apk add --no-cache just=${version}
WORKDIR /tmp
ENTRYPOINT ["just"]
