FROM java:openjdk-8u111-jre-alpine

ARG APKTOOL_VERSION=2.8.1

COPY testkey.pk8 testkey.x509.pem /KEYPAIRS/

RUN apk update &&\
    apk add --no-cache git &&\
    apk add --no-cache openssl &&\
    mkdir SIGNAPK && mkdir APKTOOL && mkdir PROJECT

RUN wget https://github.com/techexpertize/SignApk/raw/master/signapk.jar && chmod +x signapk.jar && mv signapk.jar /SIGNAPK/

RUN wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool && chmod +x apktool && mv apktool /APKTOOL/ && \
    wget -O apktool.jar https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_${APKTOOL_VERSION}.jar && chmod +x apktool.jar && mv apktool.jar /APKTOOL/