Pippin Wallet - developer wallet for Nano Currency
===

> Pippin is a production-ready, high-performance developer wallet for [Nano](https://nano.org/) and [BANANO](https://banano.cc/). 
> Pippin's API is a drop-in replacement for the Nano developer wallet that is built in to the Nano node software.  

[Pippin Wallet](https://github.com/appditto/pippin_nano_wallet) is a Python-based wallet for Nano and Banano, deployed 
as a PIP package. This Docker image simply installs that PIP package and runs it.


**Links:**

* Docker image - https://hub.docker.com/repository/docker/pskillen/pippin-wallet
* Git repo - https://github.com/pskillen/pippin-wallet

## Example Docker Compose file

Full details at [docker-compose.yaml](docker-compose.yaml)

```yaml
services:
    redis:
        image: redis:6-alpine
        ...
    
    db:
        image: postgres:13-alpine
        ...

    nano_pippin:
        image: pskillen/pippin:latest
        build:
            context: .
        environment:
            REDIS_HOST: redis
            REDIS_PORT: 6379
            REDIS_DB: 0
            REDIS_PW: supersecretpassword

            POSTGRES_HOST: db
            POSTGRES_DB: nano
            POSTGRES_USER: nano
            POSTGRES_PASSWORD: nano
    volumes:
      - ./docker-compose/nano-pippin-config.yaml:/root/PippinData/config.yaml
    ports:
      - "127.0.0.1:11338:11338/tcp"  # RPC port
    depends_on:
      redis:
      db:

```
