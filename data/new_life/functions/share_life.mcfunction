tag @s add life_tx
execute at @s if entity @p[tag=!life_tx, distance=..5, team=!dead] if entity @s[scores={lifeCount=2..}] run tag @s add tx_good
execute unless entity @s[scores={lifeCount=2..}] run tellraw @s {"text": "You don't have enough lives to do that...", "italic": true, "color": "dark_gray"}
execute at @s unless entity @p[tag=!life_tx, distance=..5, team=!dead] run tellraw @s {"text": "No one's around...", "italic": true, "color": "dark_gray"}
execute at @s run tag @p[tag=!life_tx, distance=..5, team=!dead] add life_rx

scoreboard players remove @e[tag=tx_good] lifeCount 1
execute at @e[tag=tx_good] run particle minecraft:enchanted_hit ~ ~1 ~ .3 .8 .3 .1 50 normal
execute as @e[tag=tx_good] run tellraw @s {"text": "You feel significantly weaker as one of your lives is removed... ", "italic": true, "color": "dark_red"}
advancement grant @a[tag=tx_good] only new_life:life_share

execute if entity @e[tag=tx_good] run scoreboard players add @a[tag=life_rx] lifeCount 1
execute if entity @e[tag=tx_good] as @a[tag=life_rx] at @a[tag=life_rx] run particle minecraft:totem_of_undying ~ ~1 ~ .4 .8 .4 0 50 normal
execute if entity @e[tag=tx_good] as @a[tag=life_rx] run tellraw @s {"text": "A pleasant warmth flows through your body as a new life is bestowed upon you...", "italic": true, "color": "gold"}

function new_life:update_lives

tag @e[tag=life_tx] remove life_tx
tag @e[tag=tx_good] remove tx_good
tag @e[tag=life_rx] remove life_rx