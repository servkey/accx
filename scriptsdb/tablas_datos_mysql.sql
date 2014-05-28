USE dbcontext;

DROP TABLE IF EXISTS Tbl_WindowDataGame;

CREATE TABLE Tbl_WindowDataGame(
	Id int NOT NULL AUTO_INCREMENT,
	IdRow varchar(40) NULL,
	Window int NOT NULL,
	PrivateMessages int NOT NULL,
	GlobalMessages int NOT NULL,
	GroupMessages int NULL,
	Destroyed int NULL,
	Killed int NULL,
	Score int NULL,
	TeamScore int NULL,
	CapturedFlag int NULL,
	GoalFlag int NULL,
	ViewMaps int NULL,
	ViewAvatar int NULL,
	ViewAvatarFocus int NULL,
	ViewEnemyAvatar int NULL,
	ViewEnemyAvatarFocus int NULL,
	ViewScoreTable int NULL,
	Game int NULL,
	ClientNumber int NULL,
	Username varchar(40) NULL,
	Extension text NULL,
	Date varchar(15) NULL,
	Time varchar(15) NULL,
	Team int NULL,
	GameMode int NULL,
	Ammunition int NULL,
	Life int NULL,
	Weapon int NULL,
	Host varchar(20) NULL,
	AutoDestroyed int NULL,
	ChangeWeapon int NULL,
	StoleFlag int NULL,
	PickedUpFlag int NULL,
	LostFlag int NULL,
	DroppedFlag int NULL,
	ReturnedFlag int NULL,
	HuntedFlag int NULL,
	ScoredWithFlag int NULL,
	ScoredCarryingFlag int NULL,
	RecieveMessages int NULL,
	Armour int NULL,
	Shots int NULL,
	EffectiveShot int NULL,
	EffectiveShotEnemy int NULL,
	EffectiveShotTeammate int NULL,
	EffectiveShotToStandardBearer int NULL,
	KillStandardToBearer int NULL,
	StandardBearerKillEnemys int NULL,
	StandarBearerEffectiveShot int NULL,

	shooting int NULL,
	viewingAvatarEnemyFocus int NULL,
	walking int NULL,
	jumping int NULL,
	bearer int NULL,
	viewingEnemyAvatarFocus int NULL,
	viewingAvatarFocus int NULL,
	viewingTeammateAvatarFocus int NULL,
	viewingScoreTable int NULL,
	viewingMap int NULL,
	closestBearer int NULL,
	closestBearerTeammate int NULL,
	closestCnBearer int NULL,
	closestCnTeam int NULL,
	closestCnEnemy int NULL,
	jump int NULL,
	map varchar(10) NULL,
	level int NULL,
	rolewf0 int NULL,
	rolewf1 int NULL,
	x float NULL,
	y float NULL,
	z float NULL,
	reloadGun int NULL,
	recoverBonus int NULL,

	i_health int NULL, 
	i_helmet int NULL,
	i_armour int NULL,
	i_akimbo int NULL,
	i_clips int NULL,
	i_ammo int NULL,
	i_grenade int NULL,


	teamBearer int NULL,
	state int NULL,
	teammateDestroyed int NULL,
	enemyDestroyed int NULL,
	
	PRIMARY KEY (Id)
);

DELIMITER //
DROP TRIGGER IF EXISTS idrow;
CREATE TRIGGER idrow BEFORE INSERT ON Tbl_WindowDataGame
FOR EACH ROW 
BEGIN
  DECLARE Game VARCHAR(4);
  
  DECLARE Window VARCHAR(5);

  DECLARE Team VARCHAR(3);

  DECLARE User VARCHAR(3);

  IF NEW.Game < 10 THEN
	SET Game = CONCAT('G00', NEW.Game);
  ELSEIF NEW.Game < 100 THEN
	SET Game = CONCAT('G0', NEW.Game);
  ELSEIF NEW.Game < 1000 THEN
	SET Game = CONCAT('G', NEW.Game);
  END IF;


  IF NEW.Window + 1 < 10 THEN
	SET Window = CONCAT('W000', NEW.Window + 1);
  ELSEIF NEW.Window + 1 < 100 THEN
	SET Window = CONCAT('W00', NEW.Window + 1);
  ELSEIF NEW.Window + 1 < 1000 THEN
	SET Window = CONCAT('W0', NEW.Window + 1);
  ELSEIF NEW.Window + 1 < 10000 THEN
	SET Window = CONCAT('W', NEW.Window + 1);
  END IF;

  IF NEW.Team = 0 THEN
	SET Team = 'A';
  ELSE
	SET Team = 'B';
  END IF;

  IF NEW.ClientNumber + 1 < 10 THEN
	SET User = CONCAT('0', NEW.ClientNumber + 1);
  ELSE
	SET User = CONCAT('', NEW.ClientNumber + 1);
  END IF;

  SET NEW.IdRow = CONCAT(Game, Window, Team, User);
END; //
DELIMITER ;


DROP TABLE IF EXISTS Tbl_DataGame;

CREATE TABLE Tbl_DataGame(
	Id int NOT NULL AUTO_INCREMENT,
	IdRow varchar(40) NULL,
	Window int NOT NULL,
	PrivateMessages int NOT NULL,
	GlobalMessages int NOT NULL,
	GroupMessages int NULL,
	Destroyed int NULL,
	Killed int NULL,
	Score int NULL,
	TeamScore int NULL,
	CapturedFlag int NULL,
	GoalFlag int NULL,
	ViewMaps int NULL,
	ViewAvatar int NULL,
	ViewAvatarFocus int NULL,
	ViewEnemyAvatar int NULL,
	ViewEnemyAvatarFocus int NULL,
	ViewScoreTable int NULL,
	Game int NULL,
	ClientNumber int NULL,
	Username varchar(40) NULL,
	Extension text NULL,
	Date varchar(15) NULL,
	Time varchar(15) NULL,
	Team int NULL,
	GameMode int NULL,
	Ammunition int NULL,
	Life int NULL,
	Weapon int NULL,
	Host varchar(20) NULL,
	AutoDestroyed int NULL,
	ChangeWeapon int NULL,
	StoleFlag int NULL,
	PickedUpFlag int NULL,
	LostFlag int NULL,
	DroppedFlag int NULL,
	ReturnedFlag int NULL,
	HuntedFlag int NULL,
	ScoredWithFlag int NULL,
	ScoredCarryingFlag int NULL,
	RecieveMessages int NULL,
	Armour int NULL,
	Shots int NULL,
	EffectiveShot int NULL,
	EffectiveShotEnemy int NULL,
	EffectiveShotTeammate int NULL,
	EffectiveShotToStandardBearer int NULL,
	KillStandardToBearer int NULL,
	StandardBearerKillEnemys int NULL,
	StandarBearerEffectiveShot int NULL,

	shooting int NULL,
	viewingAvatarEnemyFocus int NULL,
	walking int NULL,
	jumping int NULL,
	bearer int NULL,
	viewingEnemyAvatarFocus int NULL,
	viewingAvatarFocus int NULL,
	viewingTeammateAvatarFocus int NULL,
	viewingScoreTable int NULL,
	viewingMap int NULL,
	closestBearer int NULL,
	closestBearerTeammate int NULL,
	closestCnBearer int NULL,
	closestCnTeam int NULL,
	closestCnEnemy int NULL,
	jump int NULL,
	map varchar(10) NULL,
	level int NULL,
	rolewf0 int NULL,
	rolewf1 int NULL,
	x float NULL,
	y float NULL,
	z float NULL,
	reloadGun int NULL,
	recoverBonus int NULL,

	i_health int NULL, 
	i_helmet int NULL,
	i_armour int NULL,
	i_akimbo int NULL,
	i_clips int NULL,
	i_ammo int NULL,
	i_grenade int NULL,

	teamBearer int NULL,
	state int NULL,
	teammateDestroyed int NULL,
	enemyDestroyed int NULL,

	PRIMARY KEY (Id)
);


DROP TRIGGER IF EXISTS idrowdata;
DELIMITER //
CREATE TRIGGER idrowdata BEFORE INSERT ON Tbl_DataGame
FOR EACH ROW 
BEGIN
  DECLARE Game VARCHAR(4);
  
  DECLARE Window VARCHAR(5);

  DECLARE Team VARCHAR(3);

  DECLARE User VARCHAR(3);

  IF NEW.Game < 10 THEN
	SET Game = CONCAT('G00', NEW.Game);
  ELSEIF NEW.Game < 100 THEN
	SET Game = CONCAT('G0', NEW.Game);
  ELSEIF NEW.Game < 1000 THEN
	SET Game = CONCAT('G', NEW.Game);
  END IF;

  IF NEW.Window + 1 < 10 THEN
	SET Window = CONCAT('W000', NEW.Window + 1);
  ELSEIF NEW.Window + 1 < 100 THEN
	SET Window = CONCAT('W00', NEW.Window + 1);
  ELSEIF NEW.Window + 1 < 1000 THEN
	SET Window = CONCAT('W0', NEW.Window + 1);
  ELSEIF NEW.Window + 1 < 10000 THEN
	SET Window = CONCAT('W', NEW.Window + 1);
  END IF;

  IF NEW.Team = 0 THEN
	SET Team = 'A';
  ELSE
	SET Team = 'B';
  END IF;

  IF NEW.ClientNumber + 1 < 10 THEN
	SET User = CONCAT('0', NEW.ClientNumber + 1);
  ELSE
	SET User = CONCAT('', NEW.ClientNumber + 1);
  END IF;

  SET NEW.IdRow = CONCAT(Game, Window, Team, User);
END; //
DELIMITER ;

DROP TABLE IF EXISTS Tbl_Game;

CREATE TABLE Tbl_Game(
	Id int NOT NULL AUTO_INCREMENT,
	Date VARCHAR(20),
	Time VARCHAR(20),
	GameMode int NULL,
	Map VARCHAR(30) NULL,
	PRIMARY KEY (Id)
);

