-- Step 1: NHL Table
CREATE TABLE "NHL" (
  "season_id" INT PRIMARY KEY,
  "season_year" VARCHAR(9)
);

-- Step 2: Players Table
CREATE TABLE "Players" (
  "player_id" INT PRIMARY KEY,
  "team_id" INT,
  "name" VARCHAR(50),
  "position" VARCHAR(20),
  "skill_level" INT
);

-- Step 3: Team Table
CREATE TABLE "Team" (
  "team_id" INT PRIMARY KEY,
  "team_name" VARCHAR(50),
  "city" VARCHAR(50),
  "coach" VARCHAR(50),
  "captain_id" INT,
  "season_id" INT,
  CONSTRAINT "FK_Team_season"
    FOREIGN KEY ("season_id")
      REFERENCES "NHL"("season_id"),
  CONSTRAINT "FK_Team_captain"
    FOREIGN KEY ("captain_id")
      REFERENCES "Players"("player_id")
);

-- Step 4: Game Table
CREATE TABLE "Game" (
  "game_id" INT PRIMARY KEY,
  "host_id" INT,
  "guest_id" INT,
  "game_date" DATE,
  "host_score" INT,
  "guest_score" INT,
  CONSTRAINT "FK_Game_host"
    FOREIGN KEY ("host_id")
      REFERENCES "Team"("team_id"),
  CONSTRAINT "FK_Game_guest"
    FOREIGN KEY ("guest_id")
      REFERENCES "Team"("team_id"),
  CONSTRAINT "CHK_Different_Teams"
    CHECK ("host_id" <> "guest_id")
);

-- Step 5: Injury Records Table
CREATE TABLE "Injury_records" (
  "injury_id" INT PRIMARY KEY,
  "player_id" INT,
  "description" VARCHAR(255),
  "injury_date" DATE,
  "injury_end_date" DATE,
  CONSTRAINT "FK_InjuryRecords_player"
    FOREIGN KEY ("player_id")
      REFERENCES "Players"("player_id")
);
