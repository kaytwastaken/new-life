# give self caster tag
tag @s add caster

# if location_good
# x=20, y=63, z=25, distance=..5
# x=3671.5, y=66, z=308.5, distance=..3

# execute if entity @p[x=20, y=63, z=25, distance=..5, team=!dead] as @p[tag=caster] run tag @s add location_good
execute as @e[tag=altarStand] at @s if entity @p[distance=..5, team=!dead, tag=caster] run tag @p[tag=caster] add location_good

# if no location_good
# execute unless entity @p[x=20, y=63, z=25, distance=..5, team=!dead] run tellraw @p[tag=caster] {"text": "Your location lacks the necessary energy...", "color": "dark_gray", "italic": true}
execute as @e[tag=altarStand] at @s unless entity @p[distance=..5, team=!dead, tag=caster] run tellraw @p[tag=caster] {"text": "Your location lacks the necessary energy...", "color": "dark_gray", "italic": true}

# if xp_good
execute if entity @p[tag=caster, tag=location_good, level=15..] run tag @p[tag=caster] add xp_good
# if no xp_good
execute if entity @p[tag=location_good] unless entity @p[tag=caster, level=15..] run tellraw @p[tag=caster] {"text": "You lack the necessary experience to perform the sacrifice...", "color": "dark_gray", "italic": true}

# if totem_dropped
execute at @e[tag=altarStand] as @e[type=minecraft:item, distance=..5, nbt={Item:{id:"minecraft:enchanted_book", tag:{ Tags:[sacrificial_totem] } } } ] run tag @s add totem_item
execute if entity @e[tag=totem_item] if entity @p[tag=xp_good] run tag @p[tag=caster] add totem_good

# if no totem_dropped
execute if entity @p[tag=xp_good] unless entity @e[tag=totem_item] run tellraw @p[tag=caster] {"text": "A Sacrificial Totem is needed...", "color": "dark_gray", "italic": true}


# if all
execute as @p[tag=location_good, tag=xp_good, tag=totem_good] run tag @s add sacrifice_finished
# technical
execute as @p[tag=sacrifice_finished] run scoreboard players add @s lifeCount 1
execute as @p[tag=sacrifice_finished] run advancement grant @s only new_life:premortal
execute as @p[tag=sacrifice_finished] if entity @s[scores={lifeCount=5..}] run advancement grant @s only new_life:five_lives
execute as @p[tag=sacrifice_finished] run xp add @s -15 levels
# visual
execute as @p[tag=sacrifice_finished] at @e[tag=totem_item] run particle minecraft:flame ~ ~ ~ .4 .5 .4 .05 30 normal
execute at @p[tag=sacrifice_finished] run particle minecraft:totem_of_undying ~ ~1.5 ~ .8 1 .8 0 50 normal
execute as @p[tag=sacrifice_finished] run kill @e[tag=totem_item]
execute as @p[tag=sacrifice_finished] run playsound minecraft:item.totem.use ambient @s ~ ~ ~ 1 .9
execute as @p[tag=sacrifice_finished] run tellraw @s {"text": "A burning warmth overcomes your body as the totem burns up and a new life is formed inside you...", "italic": true, "color": "gold"}

execute as @a[tag=sacrifice_finished] run function new_life:update_lives

# cleanup
tag @a[tag=caster] remove caster
tag @a[tag=location_good] remove location_good
tag @a[tag=xp_good] remove xp_good
tag @a[tag=totem_good] remove totem_good
tag @a[tag=sacrifice_finished] remove sacrifice_finished
tag @e[tag=totem_item] remove totem_item