Select * from "NHL";

Select * from "Game";

Select * from "Team";

Select * from "Players";

Select * from "Injury_records";

SELECT
    n.season_id, 
    n.season_year,
    t.team_id, 
    t.team_name, 
    t.city, 
    p.player_id, 
    p.name AS player_name, 
    p.position, 
    g.game_id,
    g.host_score, 
    g.guest_score,
    'Guest' AS team_role
FROM 
    public."NHL" n
JOIN 
    public."Team" t ON n.season_id = t.season_id
JOIN 
    public."Players" p ON t.team_id = p.team_id
JOIN 
    public."Game" g ON g.guest_id = t.team_id
WHERE 
    n.season_id = 1
    AND t.team_id = 2
    AND p.player_id = 4;


	

