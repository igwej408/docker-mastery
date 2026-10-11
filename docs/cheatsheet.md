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

_Add to this every day._
