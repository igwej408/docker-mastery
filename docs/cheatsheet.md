# Docker Cheatsheet

## Run
```bash
docker run -d --name web -p 8080:80 nginx
docker ps -a
docker logs -f web
docker exec -it web sh
docker stop web && docker rm web
```

## Images
```bash
docker images
docker pull <image>:<tag>
docker build -t myapp:1.0 .
```

## Cleanup
```bash
docker system df
docker system prune
```

```
## Lifecycle
```bash
docker stop web / docker start web / docker restart web
docker ps -a                        # include stopped containers
docker logs -f web                  # follow logs
docker logs --tail 5 web            # last 5 lines
docker exec -it web bash            # shell inside container
docker exec web <command>           # run one command
docker inspect web                  # full details (JSON)
docker inspect -f '{{.State.Status}}' web
docker port web                     # show port mappings
docker stats --no-stream            # CPU/memory snapshot
docker rename web newname
docker rm -f web                    # force remove
```
## Images
```bash
docker images                         # list local images
docker images nginx                   # list one repository
docker pull nginx:alpine              # download an image (repo:tag)
docker history nginx:alpine           # show layers
docker image inspect nginx:alpine     # full image details
docker image inspect -f '{{.Size}}' nginx:alpine   # size in bytes
docker rmi nginx:stable               # delete an image (fails if a container uses it)
```
- Image = template, container = running instance of it.
- Name format is `repository:tag`. `latest` is only the default tag.
- `alpine` variants use a minimal base and are much smaller.
- JDK = compile and run Java, JRE = run only. Use JDK to build, JRE to ship.
- Registry = server that stores images (Docker Hub is the default, GHCR is GitHub's).

## Troubleshooting
**Error: `Cannot connect to the Docker daemon at unix:///var/run/docker.sock`**
- Cause: the Docker daemon isn't running or isn't reachable from WSL.
- Docker Desktop: restart it from the system tray (or quit and reopen), wait until it says running, and check Settings → Resources → WSL Integration for your distro.
- Docker Engine in WSL: `sudo service docker start` (or `restart`).
- Last resort: `wsl --shutdown` in PowerShell, then reopen the terminal.
- Afterwards: `docker ps -a` to see the state of existing containers, and `docker start <name>` for stopped ones.

**Error: `name already in use`**
- Cause: an old container (even a stopped one) still holds that name.
- Fix: `docker rm -f <name>` or `docker start <name>`.

**Port already in use**
- Cause: something on the host is already listening on that port (for example my Spring Boot app on 8080).
- Fix: map a different host port, for example `-p 8081:80`. Format is `host:container`.



