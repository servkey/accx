ALTER TABLE Tbl_Game ADD GameMode int NULL;
ALTER TABLE Tbl_Game ADD Map VARCHAR(30) NULL;
ALTER TABLE Tbl_DataGame ADD state int NULL;
ALTER TABLE Tbl_WindowDataGame ADD state int NULL;

ALTER TABLE Tbl_DataGame ADD teammateDestroyed int NULL;
ALTER TABLE Tbl_DataGame ADD enemyDestroyed int NULL;

ALTER TABLE Tbl_WindowDataGame ADD teammateDestroyed int NULL;
ALTER TABLE Tbl_WindowDataGame ADD enemyDestroyed int NULL;