# Docker VPS Starter

## Traefik
1. Run this command to put the proper permissions on the acme.json file. `chmod 600 ./traefik/volume/acme.json`
2. In traefik/volume/traefik.yml change the email: to your email address for the ssl certificate registration.
3. Copy sample.env to .env file and then update this file with your own settings.
4. Follow best security practices and don't check in the .env to your git repository.