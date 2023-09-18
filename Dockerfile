FROM java:openjdk-8u111-jre-alpine

ARG APKTOOL_VERSION=2.8.1

COPY testkey.pk8 testkey.x509.pem /keypairs/

RUN apk update &&\
    apk add --no-cache git &&\
    apk add --no-cache openssl

RUN wget https://github.com/techexpertize/SignApk/raw/master/signapk.jar && chmod +x signapk.jar

RUN wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool && chmod +x apktool && \
    wget -O apktool.jar https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_${APKTOOL_VERSION}.jar && chmod +x apktool.jar