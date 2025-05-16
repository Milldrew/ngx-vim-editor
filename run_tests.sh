#!/bin/sh
echo "============================"
echo "STARTING TESTS: run_tests.sh"
echo "============================"


cd ./nest-workspace/
echo "============================"
echo "STARTING NESTJS SERVER      "
echo "============================"
npm run start:dev:test
# wait for server to start
sleep 3
cd ..

cd ./playwright-tests
echo "============================"
echo "Running PLAWYRIGHT TESTS     "
echo "============================"
echo "Click the test to see the test results"
npm run core:test:headless
echo "============================"
echo "ENDING   TESTS: run_tests.sh"
echo "============================"
