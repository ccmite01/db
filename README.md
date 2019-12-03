This docker image provides a DB server for Minecraft Plug-in Server(etc CoreProtect).

# To simply use the latest stable version, run
docker run -d -p 3306:3306 -v /host/directory/db:/var/lib/mysql --name db ccmite/db


# Example Docker Compose app

* docker-compose.yml

<pre>
version: '2'
services:
# CoreProtect DB Server ##############################################
  db:
    image: ccmite/db:latest
    container_name: db
    hostname: db
    tty: true
    restart: always
    ports:
      - '0.0.0.0:3306:3306'
    volumes:
      - '/host/directory/db:/var/lib/mysql'
    environment:
      MARIADB_ROOT_PASSWORD: secretpass
      MARIADB_DATABASE: coreprotect
      MARIADB_INITDB_SKIP_TZINFO: "true"
      LANG: ja-JP.UTF-8
    mem_limit: 256m
</pre>
