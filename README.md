Admin Slack Bot With Rails
==================

![](/app/assets/images/login-screen.png)

![](/app/assets/images/dashboard-screen.png)

## Setup Docker

Build:

```
docker-compose build
```

Start:

```
docker-compose up
```

Setup Database:

```
docker-compose run app rake db:create
```

```
docker-compose run app rake db:migrate
```

Stop:

```
docker-compose stop
``