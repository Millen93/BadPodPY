FROM debian:buster AS base 
WORKDIR /app
RUN apt-get update && apt-get upgrade -y && apt-get install -yq make gcc autopoint bison libtool automake pkg-config build-essential flex autoconf gettext
ADD https://github.com/util-linux/util-linux/archive/refs/tags/v2.39.tar.gz . 
RUN tar -xf v2.39.tar.gz && rm v2.39.tar.gz && mv ./util* ./util
WORKDIR /app/util
RUN ./autogen.sh && ./configure 
RUN make LDFLAGS="--static" nsenter

FROM scratch
COPY --from=base /app/util/nsenter /nsenter
ENTRYPOINT ["/nsenter"]