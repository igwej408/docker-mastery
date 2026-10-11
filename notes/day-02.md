# Day 02: Container lifecycle

**Date:** 11/10/2026  **Time spent:** 27 min  **Phase:** Foundations

## Goal
Use ps, stop, rm, logs, exec, inspect

## What I did
- Reviewed Day 1: confirmed the `web` container was running on port 8081.
- Practiced stopping, starting and restarting a container, and saw the difference between running and exited states.
- Read container logs, including following them live while refreshing the browser.
- Ran commands inside a running container with `docker exec`.
- Inspected the container's details and resource usage.
- Edited the web page from inside the container, then deleted and recreated the container to see what happens to changes.

## Commands I used

| Command | Why I ran it |
|---|---|
| `docker ps` / `docker ps -a` | See running containers, or all containers including stopped ones |
| `docker stop web` | Stop the container (it stays on disk with status "Exited") |
| `docker start web` | Start a stopped container again |
| `docker restart web` | Stop and start in one step |
| `docker logs web` | Show everything the container has printed |
| `docker logs -f web` | Follow logs live; each browser refresh shows a new request line |
| `docker logs --tail 5 web` | Show only the last 5 log lines |
| `docker exec -it web bash` | Open an interactive shell inside the running container (`-it` = interactive terminal) |
| `docker exec web nginx -v` | Run a single command inside the container and print the nginx version, without opening a shell |
| `docker inspect web` | Print full container details as JSON (image, ports, network, state) |
| `docker inspect -f '{{.State.Status}}' web` | Pull out one field from the JSON, here the status |
| `docker port web` | Show the port mapping (8081 on the host to 80 in the container) |
| `docker stats --no-stream` | One-time snapshot of CPU, memory, network and disk usage |
| `docker exec web sh -c 'echo "<h1>Hello from Jo</h1>" > /usr/share/nginx/html/index.html'` | Change the web page from inside the container |
| `docker rm -f web` | Force-remove the container, even though it was running |
| `docker run -d --name web -p 8081:80 nginx` | Create a fresh container from the same image |

## What went wrong / what I learned
- A stopped container still exists. It shows up in `docker ps -a` and keeps its name until removed.
- `docker exec` only works on running containers. Without `-it` it runs one command and returns; with `-it bash` it opens a shell.
- `docker logs -f` is a good way to watch requests arrive in real time while refreshing the browser.
- `docker inspect` returns a lot of JSON, and `-f` pulls out a single field.
- **Key lesson:** the page I edited inside the container disappeared when I removed it and created a new one. Changes made inside a container are lost when it's deleted, because a new container starts fresh from the image. Volumes (Day 14) solve this.

## Deliverable
Added the lifecycle commands to `docs/cheatsheet.md`  - [x] done

## Tomorrow starts from
Container `web`
-
