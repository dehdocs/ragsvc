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
RUN useradd -ms /bin/bash bubble  && chown bubble:root /home/bubble
USER bubble
WORKDIR /home/bubble
COPY . .
RUN  ./configure --enable-packetver=20220330 && make clean && make sql