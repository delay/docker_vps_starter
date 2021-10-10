# Docker VPS Starter

## [Traefik](https://traefik.io)
### Traefik is a reverse proxy that forwards traffic into your docker containers and keeps your ssl certificates updated.
1. Run this command to put the proper permissions on the acme.json file. `chmod 600 ./traefik/volume/acme.json`
2. In traefik/volume/traefik.yml change the email: to your email address for the ssl certificate registration.
3. Copy sample.env to .env file and then update this file with your own settings.
4. Follow best security practices and don't check in the .env to your git repository.
5. Follow the directions in the sample.env to change the USER_PASSWORD_PAIR to something secure.

## [Netdata](https://www.netdata.cloud)
### Netdata is a realtime server monitor.
1. Copy sample.env to .env file and then update this file with your own settings.

## [Directus with Postgres Database](https://directus.io)
### Directus creates an app & API for your SQL database.
1. Copy sample.env to .env file and then update this file with your own settings.
