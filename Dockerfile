FROM ubuntu

# Install dependencies to run rathena
RUN apt-get update -y \
    && apt-get install -y \
    libmysqlclient-dev \
    zlib1g \
    gcc \
    g++ \
    make \
    git \
    curl \
    wget \
    libpcre3-dev \
    && mkdir -p /home/bubble
EXPOSE 6900 6121 5121
#create user and group
WORKDIR /home/bubble
COPY . .
RUN useradd -ms /bin/bash bubble  && chown -R bubble:root /home/bubble
USER bubble


RUN  ./configure --enable-packetver=20240614 && make clean && make sql