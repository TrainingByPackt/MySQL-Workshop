db.createCollection('countries');
db.countries.add({"code": "FR", "name": "France"});
db.countries.add({"code": "DE", "name": "Germany"});
db.countries.add({"code": "IT", "name": "Italy"});
db.countries.add(
{"code": "BE", "name": "Belgium"},
{"code": "PL", "name": "Poland"}
);
db.countries.createIndex('code',
{"fields":
  {"field": "$.code"}
}
);
