SELECT r.name,r.language,COUNT(s.id) stars FROM repositories r LEFT JOIN stars s ON s.repository_id=r.id GROUP BY r.id ORDER BY stars DESC;
WITH activity AS (SELECT c.username,r.name repository,COUNT(*) commits FROM commits x JOIN contributors c ON c.id=x.contributor_id JOIN repositories r ON r.id=x.repository_id GROUP BY c.username,r.name)
SELECT *,DENSE_RANK() OVER(PARTITION BY repository ORDER BY commits DESC) rank FROM activity ORDER BY repository,rank;
SELECT date_trunc('day',committed_at)::date day,COUNT(*) commits FROM commits WHERE committed_at>=now()-interval '7 days' GROUP BY 1 ORDER BY 1;
