# README

This is a sample Rails application from Docker for Rails Developers (PragProg).

It was generated using docker without ruby installed on the local machine.
We're using the app to discover the wonderful world of rails with docker.

Dependencies:
- Docker
- Docker compose

Clone the repo
```bash
git clone https://github.com/nullbr/railsapp_with_docker.git
```

Cd into the repository
```bash
cd railsapp_with_docker
```

Run docker-compose do build the containers in detached mode (-d)
```bash
docker-compose build -d
```

Access localhost:3000 in the browser and verify app opens up
