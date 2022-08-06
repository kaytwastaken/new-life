# create scoreboards
scoreboard objectives add onDeath deathCount
scoreboard objectives add lifeCount dummy

# create teams
team add dead
team modify dead color dark_gray
team add red
team modify red color red
team add yellow
team modify yellow color yellow
team add lightGreen
team modify lightGreen color green
team add darkGreen
team modify darkGreen color dark_green

# tellraw @a {"text": "new life loaded", "color": "aqua"}
tellraw @a {"text": "Welcome to ", "extra": [{"text": "New Life", "color": "aqua"}, {"text": " v1.0 by "}, {"text": "Kaytastrophe", "color": "light_purple", "underlined": true, "clickEvent": {"action": "open_url", "value": "https://kayt.dev"}, "hoverEvent": {"action": "show_text","contents":"Online at </kayt.dev>"}}, {"text": "!"}, {"text": "\nCheck out ", "color": "gray"}, {"text": "https://mc.kayt.dev/datapacks/new-life", "color": "gray", "underlined": true, "hoverEvent": {"action": "show_text", "contents": "Open online"}, "clickEvent": {"action": "open_url", "value": "https://mc.kayt.dev/datapacks/new-life"}}, {"text": " for more information!", "color": "gray"}]}