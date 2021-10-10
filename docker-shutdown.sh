cd traefik 
docker-compose down
cd ..
echo "stopped traefik"
cd 66analytics 
docker-compose down
cd ..
echo "stopped 66analytics"
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
docker network rm traefik_network
