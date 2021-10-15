cd traefik 
docker-compose down
cd ..
echo "stopped traefik"
cd netdata 
docker-compose down
cd ..
echo "stopped netdata"
cd posthog
docker-compose down
cd ..
echo "stopped posthog"
cd directus_postgres
docker-compose down
cd ..
echo "stopped directus and postgres"
cd plausible
docker-compose down
cd ..
echo "stopped plausible"
cd sveltekit
docker-compose down
cd ..
echo "stopped sveltekit"
cd sveltekit_postgres
docker-compose down
cd ..
echo "stopped sveltekit_postgres"
docker network rm traefik_network
