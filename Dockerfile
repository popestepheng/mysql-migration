FROM ubuntu:trusty
MAINTAINER Andi Bute <andi@projectricochet.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends mysql-client && \
    mkdir /backup

ADD run.sh /run.sh
ADD check_variables.sh /check_variables.sh
ADD fetch_from_target.sh /fetch_from_target.sh
ADD restore.sh /restore.sh

RUN chmod +x *.sh

CMD ["/run.sh"]