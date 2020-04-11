FROM alpine

RUN apk add openjdk8-jre

ARG MCV=1.15.2
ARG PV=170


RUN apk add curl jq
RUN mkdir /minecraft; cd /minecraft

RUN curl --output /minecarft/paper.jar https://papermc.io/api/v1/paper/$MCV/$PV/download

RUN apk del curl jq

RUN echo eula=TRUE > /minecraft/eula.txt

WORKDIR /minecraft
ENTRYPOINT ["java", "-jar", "/minecraft/paper.jar"]