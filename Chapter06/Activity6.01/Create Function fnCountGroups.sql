
USE ms_access_migration;

DROP FUNCTION IF EXISTS  `fnCountGroups`;

delimiter //

CREATE FUNCTION `fnCountGroups`() RETURNS long
    DETERMINISTIC
BEGIN

DECLARE TheValue Long;
SET TheValue = (SELECT Count(`Group`) AS RecCount FROM (SELECT DISTINCT series.Group FROM series )  AS `Alias`);
RETURN(TheValue);   

END//

delimiter ;