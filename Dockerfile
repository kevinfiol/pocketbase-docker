FROM docker.io/alpine:3.18

ARG TARGETARCH=arm64
ARG VERSION=0.16.2

ENV FILENAME="pocketbase_${VERSION}_linux_${TARGETARCH}"

WORKDIR /
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${VERSION}/${FILENAME}.zip && \
    unzip ${FILENAME}.zip && \
    rm ${FILENAME}.zip && \
    chmod +x pocketbase && \
    mv pocketbase /usr/bin/pocketbase && \
    mkdir /pb_data && \
    mkdir /pb_public

VOLUME /pb_data
VOLUME /pb_public

ENTRYPOINT ["/usr/bin/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb_data", "--publicDir=/pb_public"]
EXPOSE 8090
