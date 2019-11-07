\use test
\sql DESCRIBE t1
db.t1.insert().values(1, ‘test 1’);
db.t1.insert().values(2, ‘test 2’);
db.t1.select();
