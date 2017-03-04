FROM stackfeed/alpine

LABEL vendor=actionml
ENV USER aml

RUN cd /tmp && \
    apk add --no-cache \
          openssh-client \
          less \
          groff \
          python \
          make \
          py-pip \
          py2-pip && \
    pip install --upgrade pip awscli s3cmd && ln -s /config/.aws /root/.aws && \
      \
    curl -sSLo /usr/bin/consult https://github.com/outbrain/consult/releases/download/v0.0.9/consult-linux-amd64 && \
    chmod 755 /usr/bin/consult && \
      \
    useradd -Um -d /home/$USER $USER && passwd -d $USER && \
    rm -rf /tmp/* 

# Expose data volumes
WORKDIR "/config"
VOLUME ["/config", "/apps"]

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
