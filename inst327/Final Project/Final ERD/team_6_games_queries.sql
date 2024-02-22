-- Group Number: 6
-- Database: Old Games Collection
-- Team Names: Jimmy Nguyen, Benjamin Zheng, Patrice Shumate, Sumaya Amira, Saatvik Gangavarapu

-- Query 1
/* CREATE VIEW game_and_genre AS
	SELECT game_title, genre_name
		FROM games JOIN genres_has_games USING (game_id)
		JOIN genres USING (genre_id)
		ORDER BY genre_name ASC; */

-- Query 2
 /* CREATE VIEW total_sales AS
	SELECT game_title, ROUND(AVG(sales), 2) AS game_sales
		FROM games JOIN regions_has_games USING (game_id)
			JOIN regions USING (region_id)
		GROUP BY game_id
		ORDER BY game_title ASC; */

-- Query 3
/* CREATE VIEW num_games_from_PAL AS
	SELECT COUNT(game_title), region
		FROM games JOIN regions_has_games USING (game_id)
			JOIN regions USING (region_id)
		WHERE region_id = 3; */
        
-- Query 4
/* CREATE VIEW subquery AS
	SELECT game_title
		FROM games JOIN regions_has_games USING (game_id)
        JOIN regions USING (region_id)
		WHERE 
			(SELECT SUM(sales)
				FROM regions_has_games
                WHERE sales > 0)
		GROUP BY region
		ORDER BY game_title ASC; */
-- Query 5
/* CREATE VIEW num_games_per_console AS
	SELECT console_name, COUNT(game_title)
		FROM consoles JOIN games USING (console_id)
	GROUP BY console_id
	HAVING COUNT(game_title) > 15
    ORDER BY console_name */
