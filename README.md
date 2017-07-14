Admin Slack Bot With Rails
==================

![](/app/assets/images/login-screen.png)

![](/app/assets/images/dashboard-screen.png)

## Normal Setup

```
cp config/application.yml.sample config/application.yml
```

then, config env variables: `TOKEN` slack api token has been encoded and `SECRET_STR` your secret string.

Setup Database:

```
rake db:create && rake db:migrate && rake db:seed
```

Start:

```
rails s
```

Access this url: [localhost:3000](http://localhost:3000)

## Setup with Docker

First run:

```
cp docker-compose.yml.development docker-compose.yml
```

Build:

```
docker-compose build
```

Start:

```
docker-compose up
```

This app will run at: [localhost:80](http://localhost:80)

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