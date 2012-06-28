-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
DELIMITER $$
 
CREATE PROCEDURE `calcStatistics`()
BEGIN
    update data_objects set
        words_count = (wordcount(fnStripTags(object_title))
                       + wordcount(fnStripTags(description))
                       + wordcount(fnStripTags(location)))
    where words_count=0   
    ;
END$$
 
 
-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
 
CREATE FUNCTION `fnStripTags`( Dirty text ) RETURNS text CHARSET utf8
    DETERMINISTIC
BEGIN
  DECLARE iStart, iEnd, iLength int;
    WHILE Locate( '<', Dirty ) > 0 And Locate( '>', Dirty, Locate( '<', Dirty )) > 0 DO
      BEGIN
        SET iStart = Locate( '<', Dirty ), iEnd = Locate( '>', Dirty, Locate('<', Dirty ));
        SET iLength = ( iEnd - iStart) + 1;
        IF iLength > 0 THEN
          BEGIN
            SET Dirty = Insert( Dirty, iStart, iLength, '');
          END;
        END IF;
      END;
    END WHILE;
    RETURN REPLACE(Dirty, '&nbsp;', ' ');
END$$
 
-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
 
CREATE FUNCTION `FUN_CountArabicObjects`(_taxon_concept_id Integer, _taxon_status_id Integer) RETURNS int(11)
BEGIN
 
 
 
  DECLARE cnt INT;
 
 
 
  SELECT COUNT(*) into cnt
 
  FROM a_data_objects
 
    INNER JOIN data_objects_taxon_concepts
 
    ON (a_data_objects.id = data_objects_taxon_concepts.data_object_id)
    
    INNER JOIN data_objects
    
    ON(a_data_objects.id = data_objects.id)
 
    INNER JOIN taxon_concepts
 
    ON (taxon_concepts.id = data_objects_taxon_concepts.taxon_concept_id)
 
  WHERE  taxon_concepts.id=_taxon_concept_id
 
     AND (a_data_objects.process_id=_taxon_status_id+1
     OR a_data_objects.process_id = 6)
     AND data_objects.hidden = 0;
 
  RETURN cnt;

END$$
 
-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------

 
CREATE FUNCTION `FUN_CountEnglishObjects`(_taxon_concept_id Integer) RETURNS int(11)
BEGIN

  DECLARE cnt INT;

  SELECT COUNT(data_objects.id) into cnt
 
  FROM data_objects  inner join data_objects_taxon_concepts
 
    on (data_objects.id = data_objects_taxon_concepts.data_object_id)
 
  WHERE data_objects_taxon_concepts.taxon_concept_id=_taxon_concept_id
  AND data_objects.hidden = 0;

  RETURN cnt;

END$$
 
 
-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------

 
CREATE FUNCTION `wordcount`(str TEXT) RETURNS int(11)
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
    -- DECLARE wordCnt, idx, maxIdx INT DEFAULT 0;
    -- DECLARE currChar, prevChar BOOL DEFAULT 0;
    -- SET maxIdx=char_length(str);
    -- WHILE idx < maxIdx DO
    --     SET currChar=SUBSTRING(str, idx, 1) RLIKE '[[:alnum:]]';
    --     IF NOT prevChar AND currChar THEN
    --         SET wordCnt=wordCnt+1;
    --     END IF;
    --     SET prevChar=currChar;
    --     SET idx=idx+1;
    -- END WHILE;
    -- RETURN wordCnt;
    DECLARE wordCnt INT DEFAULT 0;
    -- replacing new lines
    SET str = REPLACE(REPLACE(str, '\r', ' '), '\n', ' ');
    SET str = TRIM(str);
           
    -- removing extra spaces   
    WHILE instr(str, '  ') DO
        SET str = REPLACE(str, '  ', ' ');
    END WHILE;
   
    SET wordCnt=0;
    if (length(str)>0) THEN
        SET wordCnt = length(str) +1 - length(REPLACE(str, ' ', ''));
    END IF;
    RETURN wordCnt;
  END$$
