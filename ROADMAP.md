# 30-Day Docker Roadmap

30 minutes a day. Every day starts by re-running yesterday's result and ends with something committed.

| Day | Phase | Topic | Deliverable |
|---|---|---|---|
| 1 | Foundations | [Containers vs VMs, install Docker](notes/day-01.md) | notes/day-01 + cheatsheet started |
| 2 | Foundations | [Container lifecycle](notes/day-02.md) | Add lifecycle commands to docs/cheatsheet.md |
| 3 | Foundations | [Images, tags, registries](notes/day-03.md) | Size comparison table in notes |
| 4 | Foundations | [Ports and environment variables](notes/day-04.md) | Screenshot of running service in notes |
| 5 | Foundations | [Cleanup and system hygiene](notes/day-05.md) | Cleanup section in cheatsheet |
| 6 | Foundations | [Review: rebuild from notes](notes/day-06.md) | Fixed gaps in notes; short Phase 1 summary in README |
| 7 | Dockerfiles | [First Dockerfile](notes/day-07.md) | projects/01-java-cli-container/Dockerfile |
| 8 | Dockerfiles | [Build, run, debug](notes/day-08.md) | Working image; build log excerpt in notes |
| 9 | Dockerfiles | [Layer caching](notes/day-09.md) | Before/after build time table |
| 10 | Dockerfiles | [.dockerignore, ENTRYPOINT vs CMD](notes/day-10.md) | Updated Dockerfile + explanation |
| 11 | Dockerfiles | [Multi-stage builds](notes/day-11.md) | Image size before vs after (documented) |
| 12 | Dockerfiles | [Non-root user and slim base](notes/day-12.md) | Hardened Dockerfile |
| 13 | Dockerfiles | [Project 1 write-up](notes/day-13.md) | PROJECT 1 COMPLETE: containerized Java CLI |
| 14 | Data & Compose | [Volumes](notes/day-14.md) | Demo notes: delete container, data survives |
| 15 | Data & Compose | [Bind mounts and dev workflow](notes/day-15.md) | Dev workflow section in docs |
| 16 | Data & Compose | [Container networking](notes/day-16.md) | Network diagram in notes |
| 17 | Data & Compose | [Run a database container](notes/day-17.md) | Connect with psql; document the steps |
| 18 | Data & Compose | [Compose basics](notes/day-18.md) | projects/02-compose-stack/compose.yaml |
| 19 | Data & Compose | [Compose config](notes/day-19.md) | Hardened compose.yaml |
| 20 | Data & Compose | [Project 2 write-up](notes/day-20.md) | PROJECT 2 COMPLETE: multi-container stack |
| 21 | Ship & Secure | [Registries](notes/day-21.md) | Public image link in README |
| 22 | Ship & Secure | [GitHub Actions: build](notes/day-22.md) | projects/03-ci-pipeline/.github workflow |
| 23 | Ship & Secure | [GitHub Actions: push](notes/day-23.md) | Green pipeline badge in README |
| 24 | Ship & Secure | [Image scanning](notes/day-24.md) | Scan report summary in notes |
| 25 | Ship & Secure | [Secrets and config](notes/day-25.md) | Secrets section in docs |
| 26 | Capstone | [Capstone: design](notes/day-26.md) | docs/capstone-design.md |
| 27 | Capstone | [Capstone: containerize](notes/day-27.md) | projects/04-capstone/ running locally |
| 28 | Capstone | [Capstone: CI/CD](notes/day-28.md) | Green pipeline on capstone |
| 29 | Capstone | [Capstone: docs and demo](notes/day-29.md) | PROJECT 4 COMPLETE: portfolio capstone |
| 30 | Capstone | [Portfolio polish and next steps](notes/day-30.md) | Repo pinned; next-tool plan (Kubernetes) |

## Daily routine (30 min)
- 5 min: re-run yesterday's result, read your last note
- 20 min: learn and build the day's goal
- 5 min: finish the note, commit, write 'Tomorrow starts from'

## If you miss a day
Repeat the last day. Never skip ahead.
