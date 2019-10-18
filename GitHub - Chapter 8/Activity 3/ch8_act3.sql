CREATE TABLE baby_names(
  `year_of_birth` year,
  `gender` varchar(255),
  `ethnicity` varchar(255),
  `first_name` varchar(255),
  `count` int unsigned,
  `rank` int unsigned
);
LOAD DATA INFILE '/tmp/Popular_Baby_Names.csv' INTO TABLE baby_names FIELDS TERMINATED BY ',' IGNORE 1 LINES;
