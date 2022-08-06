# execute as @a[team=dead] run gamemode creative @s

execute as @a[scores={lifeCount=0}] run team join dead @s
execute as @a[scores={lifeCount=1}] run team join red @s
execute as @a[scores={lifeCount=2}] run team join yellow @s
execute as @a[scores={lifeCount=3}] run team join lightGreen @s
execute as @a[scores={lifeCount=4..}] run team join darkGreen @s