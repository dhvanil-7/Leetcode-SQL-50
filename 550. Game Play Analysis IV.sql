SELECT 
    round(count(player_id) / (select count(distinct(player_id)) from activity), 2) as fraction
FROM activity
WHERE (player_id, event_date-INTERVAL 1 day) in (
    SELECT player_id, min(event_date)
    FROM activity
    GROUP BY player_id
)