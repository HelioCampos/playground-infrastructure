FROM dockerfile/ubuntu

MAINTAINER Wojtek Gawroński <afronski@gmail.com>

ENV EMQTT_VERSION 0.3.1-beta

RUN wget -qO archive.tgz http://emqtt.io/static/brokers/emqtt-ubuntu64-$EMQTT_VERSION.tgz && \
    tar xf archive.tgz                                                                    && \
    rm -f archive.tgz

ENV PATH $PATH:/root/emqtt/bin

CMD emqtt start                                                                           && \
    tail -F /root/emqtt/log/emqtt_info.log

EXPOSE 1883
EXPOSE 8083
