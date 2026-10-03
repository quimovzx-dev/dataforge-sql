# DATAFORGE SQL 🗄️

[![CI](https://github.com/quimovzx-dev/dataforge-sql/actions/workflows/ci.yml/badge.svg)](https://github.com/quimovzx-dev/dataforge-sql/actions/workflows/ci.yml) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A PostgreSQL analytics project demonstrating relational modeling, constraints, indexes, CTEs and window functions.

## Schema
- `repositories` — projects and languages
- `contributors` — users
- `commits` — repository activity
- `stars` — unique user/repository relationships

## Run
```bash
psql "$DATABASE_URL" -f schema.sql
psql "$DATABASE_URL" -f seed.sql
psql "$DATABASE_URL" -f analytics.sql
```

## Analytics included
- Repository popularity
- Contributor activity ranking with `DENSE_RANK()`
- Seven-day commit activity

## CI
GitHub Actions provisions PostgreSQL, loads the schema/seed data and executes the analytics queries.

## License
MIT
