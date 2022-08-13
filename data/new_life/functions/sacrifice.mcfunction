# if location_good add location_good
# x=3671.5, y=66, z=308.5, distance=..3
execute if entity @p[x=3671.5, y=66, z=308.5, distance=..3, team=!dead] as @p run tag @s add location_good
# if no location_good
execute unless entity @p[x=3671.5, y=66, z=308.5, distance=..3, team=!dead] run tellraw @p {"text": "Your location lacks the necessary energy...", "color": "dark_gray", "italic": true}

# if xp_good
execute as @a[tag=location_good] if entity @s[level=15..] run tag @s add xp_good
# if no xp_good
execute as @a[tag=location_good] unless entity @s[level=15..] run tellraw @s {"text": "You lack the necessary experience to perform the sacrifice...", "color": "dark_gray", "italic": true}

# if totem_dropped
execute as @a[tag=location_good, tag=xp_good] if entity @e[type=minecraft:item, x=3671.5, y=66, z=308.5, distance=..3, nbt={Item:{id:"minecraft:enchanted_book", tag:{ Tags:[sacrificial_totem] } } } ] run tag @e[type=minecraft:item, x=3671.5, y=66, z=308.5, distance=..3, nbt={Item:{id:"minecraft:enchanted_book", tag:{ Tags:[sacrificial_totem] } } } ] add totem_item
execute as @a[tag=location_good, tag=xp_good] if entity @e[tag=totem_item] run tag @s add totem_good

# if no totem_dropped
execute as @a[tag=location_good, tag=xp_good] unless entity @e[tag=totem_item] run tellraw @s {"text": "A Sacrificial Totem is needed...", "color": "dark_gray", "italic": true}


# if all
execute as @a[tag=location_good, tag=xp_good, tag=totem_good] run tag @s add sacrifice_finished
# technical
execute as @a[tag=sacrifice_finished] run scoreboard players add @s lifeCount 1
execute as @a[tag=sacrifice_finished] run advancement grant @s only new_life:premortal
execute as @a[tag=sacrifice_finished] if entity @s[scores={lifeCount=5..}] run advancement grant @s only new_life:five_lives
execute as @a[tag=sacrifice_finished] run xp add @s -15 levels
# visual
execute if entity @a[tag=sacrifice_finished] at @e[tag=totem_item] run particle minecraft:flame ~ ~ ~ .4 .5 .4 .05 30 normal
execute at @a[tag=sacrifice_finished] run particle minecraft:totem_of_undying ~ ~1.5 ~ .8 1 .8 0 50 normal
execute as @a[tag=sacrifice_finished] run kill @e[tag=totem_item]
execute as @a[tag=sacrifice_finished] run playsound minecraft:item.totem.use ambient @s ~ ~ ~ 1 .9
execute as @a[tag=sacrifice_finished] run tellraw @s {"text": "A burning warmth overcomes your body as the totem burns up and a new life is formed inside you...", "italic": true, "color": "gold"}

execute as @a[tag=sacrifice_finished] run function new_life:update_lives

# cleanup
execute as @a[tag=location_good] run tag @s remove location_good
execute as @a[tag=xp_good] run tag @s remove xp_good
execute as @a[tag=totem_good] run tag @s remove totem_dropped
execute as @a[tag=totem_bad] run tag @s remove totem_bad
execute as @a[tag=totem_good] run tag @s remove totem_good
execute as @a[tag=sacrifice_finished] run tag @s remove sacrifice_finished