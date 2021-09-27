FROM ubuntu:20.04
RUN apt update -y && apt install -y stress
RUN mkdir /app
WORKDIR /app
COPY memleak.sh .
ENTRYPOINT ./memleak.sh
