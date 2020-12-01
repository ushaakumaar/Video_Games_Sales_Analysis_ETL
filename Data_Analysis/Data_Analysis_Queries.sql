/* Which year did North America have highest sales */
SELECT 
	release_YEAR,
	sum(na_sales_in_millions) total_na_sales
FROM sales as s
INNER JOIN games as g
on g.game_id = s.game_id
WHERE na_sales_in_millions IS NOT NULL
GROUP BY release_year
ORDER BY sum(na_sales_in_millions) desc
LIMIT 1;

/* Which year was Global Sales the highest */
SELECT 
	release_YEAR,
	sum(na_sales_in_millions) total_na_sales,
	sum(pal_sales_in_millions) total_pal_sales,
	sum(japan_sales_in_millions) total_japan_sales,
	sum(other_sales_in_millions) total_other_sales,
	sum(global_sales_in_millions) total_global_sales,
	sum(total_shipped_in_millions) total_shipped
FROM sales as s
INNER JOIN games as g
on g.game_id = s.game_id
WHERE global_sales_in_millions IS NOT NULL
GROUP BY release_year
ORDER BY sum(global_sales_in_millions) desc
LIMIT 1;

/* Which year was Total Shipped the highest */
SELECT 
	release_YEAR,
	sum(total_shipped_in_millions) total_shipped
FROM sales as s
INNER JOIN games as g
on g.game_id = s.game_id
WHERE 
	total_shipped_in_millions IS NOT NULL AND
	release_year IS NOT NULL
GROUP BY release_year
ORDER BY sum(total_shipped_in_millions) desc
LIMIT 1;

/* Most popular video game console in various regions */

	/* Most popular video game console in NA */
	SELECT 
		c.console,
		sum(na_sales_in_millions) total_na_sales
	FROM sales as s
	INNER JOIN games as g
	on g.game_id = s.game_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE na_sales_in_millions IS NOT NULL
	GROUP BY c.console
	ORDER BY sum(na_sales_in_millions) desc
	LIMIT 1;

	/* Most popular video game console in PAL */
	SELECT 
		c.console,
		sum(pal_sales_in_millions) total_pal_sales
	FROM sales as s
	INNER JOIN games as g
	on g.game_id = s.game_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE pal_sales_in_millions IS NOT NULL
	GROUP BY c.console
	ORDER BY sum(pal_sales_in_millions) desc
	LIMIT 1;

	/* Most popular video game console in Japan */
	SELECT 
		c.console,
		sum(japan_sales_in_millions) total_sales
	FROM sales as s
	INNER JOIN games as g
	on g.game_id = s.game_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE japan_sales_in_millions IS NOT NULL
	GROUP BY c.console
	ORDER BY sum(japan_sales_in_millions) desc
	LIMIT 1;

	/* Most popular video game console in Other Regions */
	SELECT 
		c.console,
		sum(other_sales_in_millions) total_sales
	FROM sales as s
	INNER JOIN games as g
	on g.game_id = s.game_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE other_sales_in_millions IS NOT NULL
	GROUP BY c.console
	ORDER BY sum(other_sales_in_millions) desc
	LIMIT 1;

	/* Most popular video game console Globally */
	SELECT 
		c.console,
		sum(global_sales_in_millions) total_sales
	FROM sales as s
	INNER JOIN games as g
	on g.game_id = s.game_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE global_sales_in_millions IS NOT NULL
	GROUP BY c.console
	ORDER BY sum(global_sales_in_millions) desc
	LIMIT 1;

	/* Most shipped video game console */
	SELECT 
		c.console,
		sum(total_shipped_in_millions) total_shipped
	FROM sales as s
	INNER JOIN games as g
	on g.game_id = s.game_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE total_shipped_in_millions IS NOT NULL
	GROUP BY c.console
	ORDER BY sum(total_shipped_in_millions) desc
	LIMIT 1;
	
/* Most popular video game across various consoles/regions/genre */

	/* Most popular video game across various consoles */
	SELECT 
		game_name,
		console
	FROM games g
	JOIN console c
	ON g.console_id = c.console_id
	JOIN sales s
	ON s.game_id = g.game_id
	JOIN (
		SELECT g1.console_id, max(global_sales_in_millions) as "global_sales_in_millions"
		FROM GAMES as g1
		JOIN console as c1
		ON g1.console_id = c1.console_id
		JOIN sales as s1
		ON g1.game_id = s1.game_id
		GROUP BY g1.console_id
		ORDER BY g1.console_id) as v
	ON v.console_id = c.console_id AND
	   v.global_sales_in_millions = s.global_sales_in_millions
	ORDER BY c.console_id;
	
	/* Most popular video game across various genre */
	SELECT 
		game_name,
		genre
	FROM games g
	JOIN genre as gen
	ON g.genre_id = gen.genre_id
	JOIN sales as s
	ON s.game_id = g.game_id
	JOIN (
		SELECT g1.genre_id, max(global_sales_in_millions) as "global_sales_in_millions"
		FROM GAMES as g1
		JOIN genre as gen1
		ON g1.genre_id = gen1.genre_id
		JOIN sales as s1
		ON g1.game_id = s1.game_id
		GROUP BY g1.genre_id
		ORDER BY g1.genre_id) as v
	ON v.genre_id = gen.genre_id AND
	   v.global_sales_in_millions = s.global_sales_in_millions
	ORDER BY gen.genre_id;

