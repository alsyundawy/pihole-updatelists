FROM pihole/pihole:latest

COPY install.sh pihole-updatelists.* /tmp/pihole-updatelists/

RUN apt-get update && \
    apt-get install -Vy php-cli php-pdo php-pdo-sqlite php-sqlite3 php-intl php-curl && \
    apt-get clean && \
    rm -fr /var/cache/apt/* /var/lib/apt/lists/*.lz4

RUN chmod +x /tmp/pihole-updatelists/install.sh && \
    bash /tmp/pihole-updatelists/install.sh && \
    rm -fr /tmp/pihole-updatelists
