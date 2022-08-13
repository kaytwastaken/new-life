advancement revoke @a from new_life:root
advancement revoke @a from adventure
advancement revoke @a from end
advancement revoke @a from husbandry
advancement revoke @a from nether
advancement revoke @a from story

scoreboard players set @a lifeCount 3
function new_life:update_lives

execute at @s run tp @a ~ ~ ~
execute at @s run worldborder center ~ ~
execute at @s run worldborder set 50

function new_life:game/set_altar

tellraw @a "Advancements revoked, lives reset, world border centered, altar created... Ready to go!"