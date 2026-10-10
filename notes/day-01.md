# Day 01: Containers vs VMs, install Docker

**Date:** 10/10/2026  **Time spent:** 20 min  **Phase:** Foundations

## Goal
Understand what a container is; run hello-world and nginx

## What I did
- Confirmed Docker is installed and working in WSL.
- Ran the `hello-world` image to verify the setup end to end.
- Ran an nginx web server in a container and opened it in my browser.
- Hit a port conflict with my Spring Boot app and fixed it by changing the host port.

## Commands I used

| Command | Why I ran it |
|---|---|
| `docker --version` | Check Docker is installed and the CLI works |
| `docker run hello-world` | Test the full flow: Docker pulls the image, creates a container, runs it, and prints a message |
| `docker run -d --name web -p 8081:80 nginx` | Start an nginx web server in the background (`-d`), give it a name (`--name web`), and map host port 8081 to container port 80 (`-p 8081:80`) |
| `docker ps` | List running containers to confirm `web` is up |
| `docker ps -a` | List all containers, including stopped ones |
| `docker rename web newname` | Rename a container without recreating it |
| `docker stop web && docker rm web` | Stop and delete a container |

## What went wrong / what I learned
- Port 8080 was already used by my Spring Boot app, so I mapped host port 8081 instead. The format is `host:container`, so the container still listens on port 80 and only the host side changed.
- A container is a running instance of an image. `hello-world` and `nginx` are images, and each `docker run` creates a new container from one.
- Container names must be unique, and a stopped container still holds its name until it is removed.
- Docker names are case-sensitive, so `Web` and `web` are different containers.
-
