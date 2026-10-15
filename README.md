# CSCI 403 Student Environment

## Configuration

For a new setup, copy `.env.example` to `.env` and fill in your connection details.

## Docker Compose

Build the image and connect to your database:

```sh
docker compose build --pull
docker compose run --rm psql -W
```

To try [pgcli](https://github.com/dbcli/pgcli) with the same connection
settings, run:

```sh
docker compose run --rm --entrypoint pgcli psql -W
```

Both clients prompt for your database password. The image also includes
`psycopg` for Python scripts. Once pgcli connects, run `SELECT 1;` to check
the connection and `\q` to exit.

Open a shell, or run a Python script saved in this folder:

```sh
docker compose run --rm --entrypoint bash psql
docker compose run --rm --entrypoint python psql your_script.py
```

The project folder is mounted at `/workspace`, so files edited there persist
on your computer.

The base image tracks the latest stable Python 3. To refresh Python and the
database tools later, run `docker compose build --pull --no-cache`.
