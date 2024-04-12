FROM alpine:3.19
RUN apk --no-cache add sysstat jq
WORKDIR /app
COPY seepu.sh .
RUN chmod +x seepu.sh
CMD [ "watch", "-t", "-n", "5", "sh", "seepu.sh" ]