#!/bin/sh
DOCKER_TAG=${PWD##*/}
DOCKER_DEFAULT_PLATFORM=linux/amd64

docker rm -f $(docker ps -a -q --filter "ancestor=$DOCKER_TAG")
docker image rm --force $DOCKER_TAG;


NEST_PORT=3000

# Find the process ID(s) listening on the specified port
NEST_PID=$(lsof -ti :$NEST_PORT)

if [ -z "$NEST_PID" ]; then
    echo "No process found listening on port $NEST_PORT"
else
    echo "Killing process(es) listening on port $NEST_PORT"
    kill -9 $NEST_PID
    echo "Process(es) killed"
fi

PLAYWRIGHT_TEST_REPORT_PORT=9323
# Find the process ID(s) listening on the specified port
PLAYWRIGHT_TEST_REPORT_PID=$(lsof -ti :$PLAYWRIGHT_TEST_REPORT_PORT)
if [ -z "$PLAYWRIGHT_TEST_REPORT_PID" ]; then
    echo "No process found listening on port $PLAYWRIGHT_TEST_REPORT_PORT"
else
    echo "Killing process(es) listening on port $PLAYWRIGHT_TEST_REPORT_PORT"
    kill -9 $PLAYWRIGHT_TEST_REPORT_PID
    echo "Process(es) killed"
fi

docker build ${DOCKER_FLAGS:-} -t $DOCKER_TAG .
