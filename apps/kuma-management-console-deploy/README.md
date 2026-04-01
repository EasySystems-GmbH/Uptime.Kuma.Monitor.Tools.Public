# Deploy Setup

## Start Here

- Entry point: `apps/kuma-management-console-deploy/`
- Docs folder: `docs/apps/kuma-management-console-deploy/`
- Tutorial: `docs/apps/kuma-management-console-deploy/tutorial.md`
- Screenshot Preview Page: [`docs/screenshots/kmc/README.md`](../../docs/screenshots/kmc/README.md)

This folder is the compose/deployment entrypoint for local run.

## What this starts

- `docker-compose.yml` starts the Kuma Management Console.
- Runtime image is pulled from `KUMA_CONSOLE_IMAGE` (GHCR by default).
- App URL is `http://localhost:5080`.

## Prerequisites (required)

- Docker Desktop (or Docker Engine + Compose) installed and running.
- Port `5080` free on your machine.

Quick checks:

```bash
docker --version
docker compose version
```

## Stupid-proof quick start

Run these commands exactly:

```bash
cd apps/kuma-management-console-deploy
cp -n .env.example .env
docker compose up -d
docker compose ps
```

Now open `http://localhost:5080`.

Success looks like this:

- `docker compose ps` shows the container as `Up` (or `healthy`)
- Browser opens login/setup page

## First run only: set your own secret key

Default `.env` contains a placeholder `SECRET_KEY`.
Replace it once:

```bash
cd apps/kuma-management-console-deploy
python3 -c "import secrets; print(secrets.token_hex(32))"
```

Copy that value into `.env` as `SECRET_KEY=...`, then restart:

```bash
cd apps/kuma-management-console-deploy
docker compose up -d
```

## Pin image tag (recommended)

Set `KUMA_CONSOLE_IMAGE` in `.env` to an explicit release tag to avoid unexpected runtime changes:

```bash
cd apps/kuma-management-console-deploy
echo "KUMA_CONSOLE_IMAGE=ghcr.io/easystems-gmbh/kuma-management-console:v1.0.0" >> .env
docker compose up -d
```

## Common issues

- Port already in use:
  - Edit `apps/kuma-management-console-deploy/docker-compose.yml` and change `5080:5000` to another host port, e.g. `5081:5000`.
- Container not starting:
  - Run `cd apps/kuma-management-console-deploy && docker compose logs --tail=100`.
- Need to stop:
  - Run `cd apps/kuma-management-console-deploy && docker compose down`.

## Related docs

- Runtime app docs in this repo: `../README.md`
- Other apps: `../README.md`
