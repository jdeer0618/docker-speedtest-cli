FROM alpine:latest

MAINTAINER JD jd@advonanalytics.com

# Install base packages
RUN apk update && apk upgrade \
 && apk add ca-certificates && update-ca-certificates \
 && apk add --update wget python tzdata

# Clean up
   RUN rm -rf /var/cache/apk/*

# Pull speedtest-cli
RUN wget -O /usr/local/bin/speedtest https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py && chmod +x /usr/local/bin/speedtest

ENTRYPOINT ["python","/usr/local/bin/speedtest"]
