./build_docker.sh
echo 'Forwarding port 3000 for nestjs app'
echo 'Forwarding port 9323 for Playwright test reports'
docker run -p 3000:3000 -p 0.0.0.0:9323:9323 -it ${PWD##*/}
