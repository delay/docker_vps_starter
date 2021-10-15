docker network create traefik_network
echo "started traefik_network"
docker-compose --env-file ./directus_postgres/.env -f directus_postgres/docker-compose.yml build
docker-compose --env-file ./directus_postgres/.env -f directus_postgres/docker-compose.yml up -d
echo "started directus with postgres"
docker-compose --env-file ./traefik/.env -f traefik/docker-compose.yml build
docker-compose --env-file ./traefik/.env -f traefik/docker-compose.yml up -d
echo "started traefik"
docker-compose --env-file ./netdata/.env -f netdata/docker-compose.yml build
docker-compose --env-file ./netdata/.env -f netdata/docker-compose.yml up -d
echo "started netdata"
docker-compose --env-file ./posthog/.env -f posthog/docker-compose.yml build
docker-compose --env-file ./posthog/.env -f posthog/docker-compose.yml up -d
echo "started posthog"
docker-compose --env-file ./plausible/.env -f plausible/docker-compose.yml build
docker-compose --env-file ./plausible/.env -f plausible/docker-compose.yml up -d
echo "started plausible"
docker-compose --env-file ./sveltekit/.env -f sveltekit/docker-compose.yml build
docker-compose --env-file ./sveltekit/.env -f sveltekit/docker-compose.yml up --build -d
echo "started sveltekit"
docker-compose --env-file ./sveltekit_postgres/.env -f sveltekit_postgres/docker-compose.yml build
docker-compose --env-file ./sveltekit_postgres/.env -f sveltekit_postgres/docker-compose.yml up --build -d
echo "started sveltekit with postgres"
