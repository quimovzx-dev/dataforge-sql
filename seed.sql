INSERT INTO repositories(name,language) VALUES('synapse','Dart'),('vaultx','Java'),('nexus-api','PHP'),('devops-x','Bash');
INSERT INTO contributors(username) VALUES('atlas'),('nova'),('quark'),('rubisko');
INSERT INTO commits(repository_id,contributor_id,committed_at) SELECT r.id,c.id,now()-(n||' days')::interval FROM repositories r CROSS JOIN contributors c CROSS JOIN generate_series(1,4) n;
INSERT INTO stars(repository_id,contributor_id) SELECT r.id,c.id FROM repositories r CROSS JOIN contributors c WHERE r.id<>4 OR c.id<=2;
