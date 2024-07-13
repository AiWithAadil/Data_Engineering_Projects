USE Netflix

SELECT * FROM Netflix_Table
-- Q1
SELECT type, AVG(CAST(SUBSTRING(duration, 1, CHARINDEX(' ', duration)) AS INT)) as Average_Duration
FROM Netflix_Table
WHERE type = 'Movie' OR type = 'TV Show'
GROUP BY type;

-- Q2
SELECT 
    YEAR(CAST(date_added AS DATE)) AS year, 
    COUNT(title) AS Number_of_Titles
FROM 
    Netflix_Table
GROUP BY 
    YEAR(CAST(date_added AS DATE))
ORDER BY 
    YEAR(CAST(date_added AS DATE))

-- Q3
SELECT TOP 5
	   country, 
	   COUNT(type) AS number_of_TvShows
FROM 
	Netflix_Table
WHERE type = 'TV Show'
GROUP BY country
ORDER BY number_of_TvShows DESC

-- Q4
SELECT rating, 
	   release_year
	   title
FROM
	Netflix_Table
WHERE release_year >= 2015 OR type = 'Movie'


-- Q5
WITH split_cast AS (
    SELECT
        TRIM(value) as cast_member
    FROM
        Netflix_Table
	CROSS APPLY STRING_SPLIT(cast, ',')
)

SELECT
    cast_member,
    COUNT(*) AS title_count
FROM
    split_cast
GROUP BY
    cast_member
ORDER BY
    title_count DESC;

	