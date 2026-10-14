# Day 05: Cleanup and system hygiene

**Date:** ____  **Time spent:** ___ min  **Phase:** Foundations

## Goal
prune, disk usage, naming conventions

## What I did
- Reviewed Day 4: checked `docker ps -a` and confirmed `web` was still running on 8081.
- Measured Docker's disk usage before cleaning anything.
- Created throwaway containers and a dangling image on purpose, so I had safe things to clean up.
- Cleaned up from the narrowest commands to the broadest, using filters.
- Looked at naming conventions and wrote my own rules.
- Measured disk usage again to see what I reclaimed.

## Commands I used

| Command | Why I ran it |
|---|---|
| `docker ps -a` | See every container before cleaning, so I know what I'd be deleting |
| `docker system df` / `docker system df -v` | Show disk use by images, containers, volumes and build cache, and what is reclaimable |
| `docker run -d --name junk-1 nginx:alpine` (also `junk-2`, `junk-3`) | Create throwaway containers to practice cleaning |
| `docker stop junk-1 junk-2 junk-3` | Stop them, so they count as exited containers |
| `docker build -t dangle-test .` (run twice, with v1 then v2 in the Dockerfile) | Rebuild under the same tag so the old image loses its tag and becomes dangling |
| `docker images` | See the `<none>` dangling image |
| `docker ps -a --filter status=exited` | List only stopped containers |
| `docker rm junk-1` | Remove one container by name |
| `docker rm $(docker ps -aq --filter name=junk)` | Remove all containers whose name contains "junk" |
| `docker images --filter dangling=true` | List only untagged leftover images |
| `docker image prune` | Remove dangling images (asks for confirmation) |
| `docker rmi dangle-test` | Remove the test image by name |
| `docker volume ls` / `docker network ls` | See the other things Docker keeps, for later weeks |
| `docker container prune` | Remove all stopped containers |
| `docker system prune` | Remove stopped containers, dangling images, unused networks and build cache |
| `docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"` | Show containers in a readable custom layout |
| `docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"` | Show images in a readable custom layout |

## Disk usage before and after

| | Images | Containers | Build cache |
|---|---|---|---|
| Before cleanup | | | |
| After cleanup | | | |

## What went wrong / what I learned
- Measure first. `docker system df` shows what is using space and how much is reclaimable, and `docker ps -a` shows what exists before I delete it.
- Clean from narrow to broad. A filter or a specific name is safer than a blanket prune.
- A dangling image is an image that lost its tag. It happens when I rebuild under the same tag, because the name moves to the new image and the old one shows as `<none>`.
- `docker container prune` removes **all** stopped containers, not just my test ones. `docker system prune` also removes dangling images, unused networks and build cache.
- `docker system prune -a` removes every image not used by a running container, including images I pulled on purpose, and `--volumes` can delete data. I avoided both.
- Containers, images, volumes and networks are separate things. Volumes and networks matter in Weeks 3 and 4.

**Naming rules I'm adopting**
- Always set `--name`, because random names like `eager_turing` tell me nothing.
- Use `project-role` names, such as `madlibs-app` or `capstone-db`, so I can filter by prefix.
- Prefix throwaways with `junk-` or `test-`, and use `--rm` where possible.
- Pin versions in tags (`postgres:16`, not `postgres:latest`), so a rebuild next month gives the same result.
- Use lowercase and hyphens, since image names must be lowercase.

## Deliverable
Cleanup and hygiene section added to `docs/cheatsheet.md`  - [x] done

## Tomorrow starts from
`web` is running on 8081 and the test containers are cleaned up. Day 6: review, rebuilding Days 1-5 from my notes alone.
