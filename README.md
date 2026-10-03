# DATAFORGE SQL 🗄️
PostgreSQL analytics project demonstrating relational design, indexes, CTEs and window functions.

```bash
psql "$DATABASE_URL" -f schema.sql
psql "$DATABASE_URL" -f seed.sql
psql "$DATABASE_URL" -f analytics.sql
```
