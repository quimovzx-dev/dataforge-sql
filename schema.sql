DROP TABLE IF EXISTS stars, commits, contributors, repositories CASCADE;
CREATE TABLE repositories(id BIGSERIAL PRIMARY KEY,name TEXT NOT NULL UNIQUE,language TEXT NOT NULL,created_at TIMESTAMPTZ NOT NULL DEFAULT now());
CREATE TABLE contributors(id BIGSERIAL PRIMARY KEY,username TEXT NOT NULL UNIQUE);
CREATE TABLE commits(id BIGSERIAL PRIMARY KEY,repository_id BIGINT NOT NULL REFERENCES repositories(id) ON DELETE CASCADE,contributor_id BIGINT NOT NULL REFERENCES contributors(id) ON DELETE CASCADE,committed_at TIMESTAMPTZ NOT NULL);
CREATE TABLE stars(id BIGSERIAL PRIMARY KEY,repository_id BIGINT NOT NULL REFERENCES repositories(id) ON DELETE CASCADE,contributor_id BIGINT NOT NULL REFERENCES contributors(id) ON DELETE CASCADE,starred_at TIMESTAMPTZ NOT NULL DEFAULT now(),UNIQUE(repository_id,contributor_id));
CREATE INDEX idx_commits_repo_date ON commits(repository_id,committed_at DESC);
CREATE INDEX idx_stars_repo ON stars(repository_id);
