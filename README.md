# Docker VPS Starter
#### This is a starter project to setup your VPS server to run a SvelteKit app.  It also contains everything you need to run your server. A reverse proxy with ssl creation, a database with an api framework for your SvelteKit app with daily AWS S3 backups of your database, a realtime server monitor and 2 analytics packages to choose from. If you do not wish to use Directus, there is a SvelteKit version with Postgres Database.

1. Follow the steps for each app below to update the settings so it will work on your VPS.
2. You can use the shell scripts to start and stop all of the containers. `sh docker-startup.sh` and `sh docker-shutdown.sh`.  You may need to give execute permissions to yourself. `chmod 0755 docker-startup.sh` and `chmod 0755 docker-shutdown.sh`. You can comment out any containers you don't want to use.  (You have to comment out one of the SvelteKit docker containers. You probably only want to use one analytics package.)
3. I put these particular docker containers together because it is the development platform I prefer.  However you could easily make adjustments to this starter project for the frameworks and apps you wish to use.
4. I setup my VPS at [Contabo](https://contabo.com/en/).  I have also used Digital Ocean and Vultr in the past and they are both great.  However Contabo gives you a lot more resources for the price, so I went with them.

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
### Directus creates an app & API for your SQL database. Also included a [postgres backup container](https://github.com/heyman/postgresql-backup) that backs up the database daily to an Amazon S3 bucket.
1. Copy sample.env to .env file and then update this file with your own settings.
2. The S3 postgres backup container keeps the most recent 7 days of backups.  You can add an environmental variable to change it. KEEP_BACKUP_DAYS: 7

## [Sveltekit](https://kit.svelte.dev)
### SvelteKit is a framework for building web applications of all sizes.
1. Copy sample.env to .env file and then update this file with your own settings.
2. If you need run this container manually: `docker-compose up -d --build`.  This is needed so it will run the node server when it sets up the container.
3. When developing on your desktop from inside the app directory you can `npm install` and then `npm run dev -- --open` to start the dev server.
4.  The sveltekit app is in the sveltekit/app directory.  Edit this directory to create your app.  You can use the directus app to save and load data for your sveltekit app.

## [Sveltekit with Postgres Database](https://kit.svelte.dev)
### SvelteKit is a framework for building web applications of all sizes. Includes Postgres database. Also included a [postgres backup container](https://github.com/heyman/postgresql-backup) that backs up the database daily to an Amazon S3 bucket.
1. Copy sample.env to .env file and then update this file with your own settings.
2. If you need run this container manually: `docker-compose up -d --build`.  This is needed so it will run the node server when it sets up the container.
3. When developing on your desktop from inside the app directory you can `npm install` and then `npm run dev -- --open` to start the dev server.
4.  The sveltekit app is in the sveltekit/app directory.  Edit this directory to create your app.  You can use the directus app to save and load data for your sveltekit app.
2. The S3 postgres backup container keeps the most recent 7 days of backups.  You can add an environmental variable to change it. KEEP_BACKUP_DAYS: 7

## [Plausible](https://plausible.io)
### Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR.
1. Copy sample.env to .env file and then update this file with your own settings.
2. update /plausible/geoip/geoip.conf with your information.  You can sign up for a free account [here](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data?lang=en). 
3. There are some settings for a relay host for the smtp server.  You can remove these if you want to use the local smtp server. You can use a relay service and fill in those fields for a simpler configuration.  There are many third party mail senders (Mailgun, Sendgrid, AWS etc).  

## [Posthog](https://posthog.com)
### Open source product analytics. Works with your event pipelines and data warehouse. This is for complex analytics analysis.  It has heat maps, session replays, funnel tracking etc.  
1. Copy sample.env to .env file and then update this file with your own settings.
 

