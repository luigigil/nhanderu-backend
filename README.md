# Nhanderu REST API

## Description

This project contains the backend code and REST API of Nhanderu.

## Table of Contents

- [Features](#features)
- [Quick run](#quick-run)
- [Comfortable development](#comfortable-development)
- [Links](#links)
- [Automatic update of dependencies](#automatic-update-of-dependencies)
- [Database utils](#database-utils)
- [Tests](#tests)

## Features

- [x] Database ([typeorm](https://www.npmjs.com/package/typeorm)).
- [x] Seeding.
- [x] Config Service ([@nestjs/config](https://www.npmjs.com/package/@nestjs/config)).
- [x] Mailing ([nodemailer](https://www.npmjs.com/package/nodemailer), [@nestjs-modules/mailer](https://www.npmjs.com/package/@nestjs-modules/mailer)).
- [x] Sign in and sign up via email.
- [x] Social sign in (Apple, Facebook, Google, Twitter).
- [x] Admin and User roles.
- [x] I18N ([nestjs-i18n](https://www.npmjs.com/package/nestjs-i18n)).
- [x] File uploads. Support local and Amazon S3 drivers.
- [x] Swagger.
- [x] E2E and units tests.
- [x] Docker.
- [x] CI (Github Actions).

## Quick run

```bash
git clone --depth 1 https://github.com/luigifsl/nhanderu-backend.git nhanderu-backend
cd nhanderu-backend/
cp .env.example .env
docker compose up -d
```

For check status run

```bash
docker compose logs
```

## Local development

```bash
git clone --depth 1 https://github.com/luigifsl/nhanderu-backend.git nhanderu-backend
cd nhanderu-backend/
cp .env.example .env
```

Change `DATABASE_HOST=postgres` to `DATABASE_HOST=localhost`

Change `MAIL_HOST=maildev` to `MAIL_HOST=localhost`

Run additional container:

```bash
docker compose up -d postgres adminer maildev redis
```

```bash
yarn install

yarn migration:run

yarn seed:run

yarn start:dev
```

## Links

- Swagger: http://localhost:3000/docs
- Adminer (client for DB): http://localhost:8080
- Maildev: http://localhost:1080


## Database utils

Generate migration

```bash
yarn migration:generate -- src/database/migrations/CreateNameTable 
```

Run migration

```bash
yarn migration:run
```

Revert migration

```bash
yarn migration:revert
```

Drop all tables in database

```bash
yarn schema:drop
```

Run seed

```bash
yarn seed:run
```

## Tests

```bash
# unit tests
yarn test

# e2e tests
yarn test:e2e
```

## Tests in Docker

```bash
docker compose -f docker-compose.ci.yaml --env-file .env.example -p ci up --build --exit-code-from api && docker compose -p ci rm -svf
```

## Test benchmarking

```bash
docker run --rm jordi/ab -n 100 -c 100 -T application/json -H "Authorization: Bearer USER_TOKEN" -v 2 http://<server_ip>:3000/api/v1/users
```
