CREATE DATABASE IPL_Analysis;
USE IPL_Analysis;

CREATE TABLE matches (
    id INT PRIMARY KEY,
    season INT,
    city VARCHAR(50),
    date DATE,
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    toss_winner VARCHAR(50),
    toss_decision VARCHAR(10),
    result VARCHAR(20),
    winner VARCHAR(50),
    player_of_match VARCHAR(50),
    venue VARCHAR(100)
);


# 1. How many matches were played in total?
SELECT COUNT(*) AS total_matches FROM matches;
#(Explanation: This counts all the matches in the matches table.)


# 2. What are the unique seasons available?
SELECT DISTINCT season FROM matches;
#(Explanation: This shows the different IPL seasons.)

# 3. Which city hosted the most matches?
SELECT city, COUNT(*) AS match_count
FROM matches
GROUP BY city
ORDER BY match_count DESC
LIMIT 1;
#(Explanation: Groups matches by city and finds the one with the most matches.)


# 4. Which team won the most matches?
SELECT winner, COUNT(*) AS wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY wins DESC
LIMIT 1;
#(Explanation: Counts the number of wins for each team and finds the top team.)


# 5. Who won the most ‘Player of the Match’ awards?
SELECT player_of_match, COUNT(*) AS awards
FROM matches
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 1;
#(Explanation: Finds the player who received the most awards.)


# 6. What is the percentage of toss decisions (Bat or Field)?
SELECT toss_decision, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM matches) AS percentage
FROM matches
GROUP BY toss_decision;
#(Explanation: Calculates how often each toss decision was made.)


# 7. Which venue hosted the most IPL matches?
SELECT venue, COUNT(*) AS total_matches
FROM matches
GROUP BY venue
ORDER BY total_matches DESC
LIMIT 1;
#(Explanation: Displays the venue with the most matches.)


#  8. How many matches were won by the team that won the toss?
SELECT COUNT(*) AS toss_winner_and_match_winner
FROM matches
WHERE toss_winner = winner;
#(Explanation: Finds how many times the toss winner also won the match.)


# 9. Display all matches from a specific season (e.g., 2023)
SELECT * FROM matches
WHERE season = 2023;
#(Explanation: Filters and shows all matches from the 2023 season.)


# 10. List the matches that ended with a ‘Super Over’
SELECT * FROM matches
WHERE result = 'tie';
#(Explanation: Finds all the matches that were tied and led to a Super Over.)


# 11. Which season had the most matches played?
SELECT season, COUNT(*) AS total_matches
FROM matches
GROUP BY season
ORDER BY total_matches DESC
LIMIT 1;
#(Explanation: Finds the season with the highest number of matches.)


# 12.Which team won by the highest runs?
SELECT winner, target_runs
FROM matches
ORDER BY target_runs DESC
LIMIT 1;
#(Explanation: Identifies the team that won by the largest margin of runs.)


# 13. Find all the matches played between two specific teams (e.g., MI and CSK)
SELECT * FROM matches
WHERE (team1 = 'Mumbai Indians' AND team2 = 'Chennai Super Kings')
   OR (team1 = 'Chennai Super Kings' AND team2 = 'Mumbai Indians');
   #(Explanation: Displays all matches where Mumbai Indians and Chennai Super Kings faced each other.)














