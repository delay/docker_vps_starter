# Docker VPS Starter
#### This is a starter project to setup your VPS server to run a Sveltekit app.  It also contains everything you need to run your server. A reverse proxy with ssl creation, a database with an api framework for your sveltekit app, a realtime server monitor and a few analytics packages to choose from. 

1. Follow the steps for each app below to update the settings so it will work on your VPS.
2. You can use the shell scripts to start and stop all of the containers. `sh docker-startup.sh` and `sh docker-shutdown.sh`.  You may need to give execute permissions to yourself. `chmod 0755 docker-startup.sh` and `chmod 0755 docker-shutdown.sh`. You can comment out any containers you don't want to use.  (You probably only want to use one analytics package.)
3. I put these particular docker containers together because it is the development platform I prefer.  However you could easily make adjustments to this starter project for the frameworks and apps you wish to use.

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

## [Sveltekit](https://kit.svelte.dev)
### SvelteKit is a framework for building web applications of all sizes.
1. Copy sample.env to .env file and then update this file with your own settings.
2. If you need run this container manually: `docker-compose up -d --build`.  This is needed so it will run the node server when it sets up the container.
3. When developing on your desktop from inside the app directory you can `npm run dev -- --open` to start the dev server.
4.  The sveltekit app is in the sveltekit/app directory.  Edit this directory to create your app.  You can use the directus app to save and load data for your sveltekit app.

## [Plausible](https://plausible.io)
### Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR.
1. Copy sample.env to .env file and then update this file with your own settings.
2. There are some settings for a relay host for the smtp server.  You can remove these if you want to use the local smtp server. You can use a relay service and fill in those fields for a simpler configuration.  There are many third party mail senders (Mailgun, Sendgrid, AWS etc).  

## [Posthog](https://posthog.com)
### Open source product analytics PostHog keeps you in control of customer data. Works with your event pipelines and data warehouse. This is for complex analytics analysis.
1. Copy sample.env to .env file and then update this file with your own settings.
 
 ## [66analytics](https://66analytics.com)
### Web analytics made easy. Self-hosted, friendly, all-in-one web analytics tool. Lightweight tracking, session replays, heatmaps, user journeys & more.
1. This is the only container that will not work without purchasing something.  I like this analytics app because it has heatmaps and records user sessions which can help with debugging.  At the time I wrote this, it was $79.  It is similar to analytics like [fullstory](https://www.fullstory.com), [luckyorange](https://www.luckyorange.com) and [hotjar](https://www.hotjar.com) but its self hosted.  If you don't need heatmaps and user session recording, plausible listed above has similar features.
2. You need to buy the script and place it in the /66analytics/66analytics folder.
3. Copy sample.env to .env file and then update this file with your own settings.

