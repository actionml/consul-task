FROM stackfeed/alpine

LABEL vendor=actionml
ENV USER aml

RUN cd /tmp && \
    apk add --no-cache \
          less \
          groff \
          python \
          py-pip \
          py2-pip && \
    pip install --upgrade pip awscli s3cmd && ln -s /config/.aws /root/.aws && \
      \
    curl -sSLo /usr/bin/consult https://github.com/outbrain/consult/releases/download/v0.0.9/consult-linux-amd64 && \
    chmod 755 /usr/bin/consult && \
      \
    curl -sSLo task.tgz https://github.com/go-task/task/releases/download/v1.0.0/task_Linux_x86_64.tar.gz && \
    tar xz -C /usr/bin -f task.tgz && chmod 755 /usr/bin/task && \
    useradd -Um -d /home/$USER $USER && passwd -d $USER && \
    rm -rf /tmp/* 

# Expose data volumes
WORKDIR "/config"
VOLUME ["/config", "/apps"]

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
