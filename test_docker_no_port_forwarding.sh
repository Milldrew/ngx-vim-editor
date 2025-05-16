./build_docker.sh
docker run --rm ${PWD##*/} ./run_tests.sh
