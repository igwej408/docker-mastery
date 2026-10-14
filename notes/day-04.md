# Day 04: Ports and environment variables

**Date:** 13/10/2026  **Time spent:** 50 min  **Phase:** Foundations

## Goal
Use -p and -e; reach a container from the browser

## What I did
- Reviewed Day 3: confirmed Docker was running and `web` was still on port 8081.
- Learned how port publishing works and ran two containers from the same image on different host ports.
- Caused a port clash on purpose to see the error.
- Passed configuration into containers with environment variables, using `-e` and an env file.
- Created `app.env` in the wrong folder, moved it into the repo, and set up `.gitignore` so env files never reach GitHub.
- Cleaned up the test containers.

## Commands I used

| Command | Why I ran it |
|---|---|
| `docker run -d --name web-a -p 8082:80 nginx:alpine` | Start nginx and publish container port 80 on host port 8082 |
| `docker run -d --name web-b -p 8083:80 nginx:alpine` | Second container from the same image on a different host port |
| `docker run -d --name web-c -p 8082:80 nginx:alpine` | Deliberately reuse 8082 to see the "port already allocated" error |
| `docker rm web-c` | Remove the stopped container the failed attempt left behind |
| `docker run -d --name web-local -p 127.0.0.1:8084:80 nginx:alpine` | Publish the port to my own machine only, not the whole network |
| `docker run -d --name web-random -P nginx:alpine` | Publish exposed ports on random free host ports |
| `docker port web-random` | See which host port Docker picked |
| `docker run --rm -e GREETING=hello alpine printenv GREETING` | Pass one env var and print it (`--rm` deletes the container when it exits) |
| `docker run --rm -e APP_ENV=dev -e APP_PORT=9000 alpine printenv` | Pass several env vars with repeated `-e` |
| `docker run -d --name pg-test postgres:16` | Start Postgres without a password to see what happens |
| `docker logs pg-test` | Read why it failed: it needs `POSTGRES_PASSWORD` |
| `docker run -d --name pg-test -e POSTGRES_PASSWORD=devpass postgres:16` | Run it properly with a throwaway password (local learning only) |
| `printf "APP_ENV=dev\nAPP_PORT=9000\n" > app.env` | Create an env file with two `KEY=value` lines |
| `docker run --rm --env-file app.env alpine printenv` | Load all variables from the file with one flag |
| `docker inspect -f '{{.Config.Env}}' pg-test` | See the env vars a container was started with |
| `echo "*.env" >> .gitignore` | Make git ignore any file ending in `.env` |
| `git status` / `git check-ignore -v app.env` | Confirm `app.env` is ignored |
| `mv ~/app.env ~/docker-mastery/app.env` | Move the file into the repo folder |
| `docker rm -f web-a web-b web-local web-random pg-test` | Clean up the test containers |

## What went wrong / what I learned

**Issue: `app.env` created in the wrong folder**
- I ran `printf ... > app.env` while my terminal was in my home folder (`~`), so the file landed there instead of in the repo.
- Commands create files in the current folder, so `pwd` shows where I am before I create anything.
- Fix: `mv ~/app.env ~/docker-mastery/app.env`, then `cd ~/docker-mastery`.
- The same mistake applied to `echo "*.env" >> .gitignore`, which may have added the line to the wrong `.gitignore`. I checked both files and made sure the repo's copy had the rule.
- Habit: start every session with `cd ~/docker-mastery`.

**Issue: `.gitignore` didn't cover `app.env`**
- The starter `.gitignore` had `.env`, which only matches a file named exactly `.env`.
- `*.env` matches any file ending in `.env`, such as `app.env` or `db.env`.
- Verified with `git status` (`app.env` not listed, only `.gitignore` modified) and `git check-ignore -v app.env`.

**Ports**
- Format is `host:container`. Only the host side has to be unique, so two containers can both listen on 80 inside as long as their host ports differ.
- Reusing a host port gives a "port is already allocated" error. Docker creates the container before failing to start it, so a stopped leftover remains and needs `docker rm`.
- `127.0.0.1:8084:80` limits access to my own machine, which is safer for anything private.
- `-P` publishes exposed ports on random host ports, and `docker port <name>` shows which.

**Environment variables**
- `-e KEY=value` passes a setting into a container, and `--env-file` loads many at once from a file.
- Some images won't start without them. Postgres refuses to run until `POSTGRES_PASSWORD` is set.
- `--rm` is useful for quick throwaway tests because the container deletes itself on exit.
- Env files often hold secrets in real projects, so they must be git-ignored before any real password goes in. Proper secrets handling comes on Day 25.

## Deliverable
Screenshot of two nginx containers running on different host ports  - [x] done

![Two nginx containers on different host ports](images/day-04-ports.png)

## Tomorrow starts from
`web` still running on 8081, test containers cleaned up, `app.env` ignored by git. Day 5: cleanup and system hygiene (prune, disk usage, naming).
