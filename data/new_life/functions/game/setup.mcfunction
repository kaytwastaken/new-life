scoreboard players set @a lifeCount 3
function new_life:update_lives

execute at @s run tp @a ~ ~ ~
execute at @s run worldborder center ~ ~
execute at @s run worldborder set 50