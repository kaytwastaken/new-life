# move altar armor stand
kill @e[type=armor_stand, tag=altarStand]
summon minecraft:armor_stand ~ ~ ~ { Invisible:1b, Invulnerable:1b, NoGravity:1b, Tags:[altarStand] }

# Visible for debug
# summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b, Tags:[altarStand]}