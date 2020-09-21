# pyserv
Python Web Server skeleton using CherryPy and Alpine that runs in a Docker container

# Build
`$ docker-compose build`

# Run
`$ docker-compose up -d`

Verify the container is running: `$ docker container ps`

Point browser to http://locahost:4003/

View the web server logs: `$ docker logs -f pyserv_hello`

# Stop
`$ docker-compose down`
