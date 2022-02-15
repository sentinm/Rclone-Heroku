FROM ubuntu:16.04

WORKDIR /app

ENV USERNAME=admin
ENV PASSWORD=admin

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "LANG=en_US.UTF-8" >> /etc/environment
RUN echo "NODE_ENV=development" >> /etc/environment
RUN more "/etc/environment"

RUN apt-get update
RUN apt-get install curl git -y

RUN curl -sL https://rclone.org/install.sh | bash
RUN rclone version

ADD run.sh /app/

CMD ["./run.sh"]
