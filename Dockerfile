FROM ubuntu:latest

LABEL maintainer "Gertjan Manenschijn" email="gertjan@manenschijn.org"

RUN apt-get update \
  && apt-get install -y davfs2 ca-certificates \
  && apt-get install -y borgbackup python3-pip \
  && mkdir -p /mnt/source \
  && mkdir -p /mnt/webdrive \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN pip3 install --user --upgrade borgmatic
RUN export PATH="$PATH:~/.local/bin"

COPY ./config.yaml /etc/borgmatic/config.yaml

COPY ./run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT [ "/usr/local/bin/run.sh" ]
