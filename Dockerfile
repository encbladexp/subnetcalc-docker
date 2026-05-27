ARG ALPINE_VERSION=3.23.4
FROM alpine:${ALPINE_VERSION} AS build
ARG SUBNETCALC_VERSION=2.6.6
RUN apk update && \
    apk --no-cache add make cmake g++ curl geoip gettext
WORKDIR /
RUN curl -Lo subnetcalc.tar.gz https://github.com/dreibh/subnetcalc/archive/refs/tags/subnetcalc-${SUBNETCALC_VERSION}.tar.gz && \
    tar xf subnetcalc.tar.gz
WORKDIR /subnetcalc-subnetcalc-${SUBNETCALC_VERSION}
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr . && \
    make && \
    make install

FROM alpine:${ALPINE_VERSION}
COPY --from=build /usr/bin/subnetcalc /usr/bin/subnetcalc
RUN apk update && \
    apk --no-cache add libstdc++ geoip gettext && \
    rm /var/cache/apk/*
ENTRYPOINT [ "/usr/bin/subnetcalc" ]
