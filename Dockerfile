FROM mariadb/server:10.4
LABEL maintainer="ccmite"
WORKDIR /

RUN : "add package" && \
    apt --allow-releaseinfo-change update && apt install -y \
    locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    sed -i 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/g' /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    update-locale LANG=ja_JP.UTF-8 && \
    rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Japan /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3306
CMD ["mysqld"]

