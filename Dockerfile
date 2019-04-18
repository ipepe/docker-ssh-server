FROM ubuntu:18.04
MAINTAINER docker@ipepe.pl

RUN apt-get update && apt-get install -y openssh-server && \
    groupadd -g 1000 webapp && \
    useradd -m -s /bin/bash -g webapp -u 1000 webapp && \
    echo "webapp:Password1" | chpasswd && \
    echo "#!/bin/bash" > /docker-entrypoint.sh && \
    echo "service ssh start" >> /docker-entrypoint.sh && \
    echo "tail -f /dev/null" >> /docker-entrypoint.sh && \
    chmod +x /docker-entrypoint.sh

EXPOSE 22 8080 8443
CMD ["/docker-entrypoint.sh"]