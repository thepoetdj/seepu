FROM alpine:3.19
RUN apk --no-cache add sysstat jq
ENV INTERVAL=5
ENV STATS_LOG_FILE=/var/log/seepu.log
WORKDIR /opt/seepu
COPY seepu.sh .
RUN chmod +x seepu.sh
CMD [ "sh", "-c", "watch -t -n $INTERVAL sh seepu.sh" ]