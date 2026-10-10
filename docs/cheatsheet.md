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

_Add to this every day._
