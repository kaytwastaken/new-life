execute if entity @a[scores={onDeath=1}, team=!dead] as @a[scores={onDeath=1}, team=!dead] run scoreboard players remove @s lifeCount 1
# On death of an alive player, remove one life from onDeath player

execute as @a[scores={onDeath=1, lifeCount=0}, team=!dead] run team join dead @s
# For all onDeath players with 0 lives, join team dead

execute as @a[scores={onDeath=1}, team=dead] run gamemode spectator @s
# For all onDeath players on dead team, switch to spectator

execute as @a[scores={onDeath=1, lifeCount=1}, team=!dead] run team join red @s
# For all onDeath players with 1 life join team red

execute as @a[scores={onDeath=1, lifeCount=2}, team=!dead] run team join yellow @s
# For all onDeath players with 2 lives join team yellow

execute as @a[scores={onDeath=1, lifeCount=3}, team=!dead] run team join lightGreen @s
# For all onDeath players with 3 lives join team lightGreen

execute as @a[scores={onDeath=1, lifeCount=4..}, team=!dead] run team join darkGreen @s
# For all onDeath players with 4 or more lives join team darkGreen

execute as @a[scores={onDeath=1}] run scoreboard players set @s onDeath 0
# For all onDeath players set onDeath to 0