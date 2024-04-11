FROM alpine:3.19
RUN apk --no-cache add sysstat jq
WORKDIR /app
COPY stats.sh .
RUN chmod +x stats.sh
CMD [ "watch", "-t", "-n", "5", "sh", "stats.sh" ]