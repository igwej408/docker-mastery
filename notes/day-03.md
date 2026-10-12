# Day 03: Images, tags, registries

**Date:** 12/10/2026  **Time spent:** 40 min  **Phase:** Foundations

## Goal
Pull images, read tags, compare sizes (temurin, alpine, slim)

## What I did
- Reviewed Day 2 and tried to start my `web` container, but hit a Docker daemon connection error (details below).
- Fixed it by restarting Docker Desktop, then confirmed `web` was running again.
- Learned the difference between an image (read-only template) and a container (running instance of an image).
- Pulled different variants of nginx and Java images and compared their sizes.
- Looked at image layers with `docker history`.
- Ran the smaller alpine nginx image on a second port to prove it works the same way.
- Cleaned up the extra container and image.

## Commands I used

| Command | Why I ran it |
|---|---|
| `docker images` | List images stored locally, with repository, tag, ID and size |
| `docker pull nginx:alpine` | Download the minimal-base variant of nginx |
| `docker pull nginx:stable` | Download the stable-tagged variant to compare |
| `docker pull eclipse-temurin:21-jdk` | Download the Java image with compiler and build tools |
| `docker pull eclipse-temurin:21-jre` | Download the run-only Java image |
| `docker pull eclipse-temurin:21-jre-alpine` | Download the run-only Java image on a minimal base |
| `docker images nginx` / `docker images eclipse-temurin` | Compare sizes for one repository at a time |
| `docker history nginx:alpine` | Show the layers an image is built from |
| `docker run -d --name web-alpine -p 8082:80 nginx:alpine` | Run the alpine variant on port 8082 so it doesn't clash with `web` on 8081 |
| `curl localhost:8082` | Confirm the alpine container serves the nginx page |
| `docker rm -f web-alpine` | Remove the test container |
| `docker rmi nginx:stable` | Delete an image I no longer need (fails if a container uses it) |

## Image size comparison

| Image | Size | Notes |
|---|---|---|
| nginx:latest | | Debian-based |
| nginx:alpine | | Minimal base, much smaller |
| nginx:stable | | Stable release line |
| eclipse-temurin:21-jdk | | Compiler and build tools |
| eclipse-temurin:21-jre | | Run-only |
| eclipse-temurin:21-jre-alpine | | Run-only on minimal base |

## What went wrong / what I learned

**Issue: Docker daemon not running**
- Running `docker run -d --name web -p 8081:80 nginx` gave: `Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?`
- Meaning: the Docker CLI was fine, but the daemon (the background service that actually runs containers) wasn't running or reachable from WSL.
- Fix: restarted Docker Desktop on Windows and waited until it reported running. After that `docker ps` worked and the `web` container was running again.
- Other things I could have tried: `sudo service docker restart` (if Docker Engine is installed directly in WSL), checking Docker Desktop's WSL integration setting, or `wsl --shutdown` as a last resort.
- Lesson: when Docker commands fail with a daemon error, check the daemon first. Containers belong to the daemon, so after a restart always run `docker ps -a` to see what state they are in.

**What I learned about images**
- An image is the template, a container is a running instance, and many containers can come from one image.
- A full image name is `repository:tag`. `latest` is only the default tag, and it doesn't guarantee the newest version.
- The same software can come in very different sizes depending on its base. Alpine variants are much smaller.
- JDK includes build tools and JRE only runs Java, so the JRE is smaller. This is the reason to use a multi-stage build later (compile with the JDK, ship with the JRE).
- Images are built from stacked layers, which `docker history` shows.
- A registry stores images. Docker Hub is the default, and I will push to GitHub Container Registry on Day 21.

## Deliverable
Image size comparison table above, and Images and Troubleshooting sections added to `docs/cheatsheet.md`  - [x] done

## Tomorrow starts from
`web` is running on 8081 after the Docker Desktop restart. Day 4: ports and environment variables.
