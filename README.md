Admin Slack Bot With Rails
==================

[![CircleCI](https://circleci.com/gh/minhquan4080/slackapp.xyz/tree/master.svg?style=svg)](https://circleci.com/gh/minhquan4080/slackapp.xyz/tree/master)

![](/app/assets/images/login-screen.png)

![](/app/assets/images/dashboard-screen.png)

If use with Postgres:

```
cp config/application.yml.postgresql config/application.yml
```

Add `gem 'pg'` to `Gemfile`.

If use with mysql2:

```
cp config/application.yml.mysql2 config/application.yml
```

Add `gem 'mysql2'` to `Gemfile`.

then, config env variables: `TOKEN` slack api token has been encoded and `SECRET_STR` your secret string.

## Normal Setup

Setup Database:

```
rake db:create && rake db:migrate && rake db:seed
```

Start:

```
rails s
```

or

```
./bin/server
```

Access this url: [localhost:3000](http://localhost:3000)

## Setup with Docker

### nginx

If you want use **port 80**

```
cp containers/common/development.nginx.config containers/nginx/nginx.conf
```

If you want use **port 8080**

```
cp containers/common/staging.nginx.config containers/nginx/nginx.conf
```

Another, you can change **port**.

If use with Postgres:

```
cp docker-compose.yml.postgres.development docker-compose.yml
```

If use with Mysql:

```
cp docker-compose.yml.mysql.development docker-compose.yml
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
docker-compose run app rake db:create db:migrate db:seed
```

Stop:

```
docker-compose stop
```

**Note: Remove all containers**

```
docker-compose rm -v
```