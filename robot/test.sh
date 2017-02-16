#!/bin/bash

# Build application
docker build -t hello-go ..
# Start application and selenium runner
docker run -d -p 8080:80 --name hello-go-test hello-go
docker run -d -p 4444:4444 --name selenium --net=host selenium/standalone-firefox
echo "Give them a second to get started"
sleep 5

# Set environment variables for local testing 
export APPLICATION_HOST=localhost:8080
export SELENIUM_REMOTE_URL=http://localhost:4444/wd/hub

# Run the tests
pybot .

# Clean up
docker rm -f hello-go-test
docker rm -f selenium
