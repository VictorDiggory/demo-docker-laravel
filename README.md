
## About

This is demo for deploy src laravel default with docker and docker compose.

There is 5 container:
* Laravel app
* PostgreSQL
* PgAdmin - Web UI for postgreSQL
* Caddy
* RabbitMQ


## Install

### 1. Clone src 

> git clone git@github.com:VictorDiggory/demo-docker-laravel.git

### 2. Run Docker 

> docker compose build --no-cache
> 
> docker compose up -d

### 3. Open browser

> Open browser 
> 
> type link https://localhost/ for laravel page
> 
> type link https://localhost:5050 for Web UI postgreSQL
> 
> type link https://localhost:15672 for Web UI RabbitMQ
> 
> Account and Password you can find in docker compose file
