FROM python:3-slim-trixie

ENV EDITOR=nano VISUAL=nano PSQL_EDITOR=nano PSQL_PAGER=less

RUN apt-get update \
    && apt-get install --yes --no-install-recommends postgresql-client ca-certificates nano vim-tiny less \
    && rm -rf /var/lib/apt/lists/*

RUN python -m pip install --no-cache-dir pg8000

WORKDIR /workspace
ENTRYPOINT ["psql"]