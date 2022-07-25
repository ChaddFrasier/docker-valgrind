FROM ubuntu:bionic

RUN apt-get -y update
RUN apt-get -y upgrade && \
    apt-get -y install build-essential \
        git \
        cmake \
        autoconf \
        libtool \
        pkg-config \
        ca-certificates \
        valgrind

COPY ./test/Hello.c ./test/Hello.c
RUN gcc test/Hello.c -o /test/Test.exe

ENTRYPOINT [ "valgrind" ]
CMD [ "--leak-check=yes", "./test/Test.exe" ]
