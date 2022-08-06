# New Life
Datapack for the New Life multiplayer gamemode by Kayt_was_taken

Read more at [https://mc.kayt.dev/datapacks/new-life](https://mc.kayt.dev/datapacks/new-life)

## Configuring Variables
Currently, the only way to configure the starting variables (such as where the altar is for gaining lives) is to edit the `data/new-life/functions/sacrifice.mcfunction` file. In the future a command will be used to edit this in game.

## Features

### Hardcore Lives

As mentioned before, each player starts with a specific number of lives, and loses one on each death. After losing their last life, they are given a gray name and set to spectator mode.

### Magic

Gaining and transfering lives is done through a custom spellbook. On servers, it's common to have one book placed in a specific place (e.g. an ancient city). To get the book, run /function new_life:debug/give_book. A crafting recipe or loot table may be added in the future.

To gain lives, you drop a Sacrifical Totem near an altar and cast the spell from the book (you just click on it) which will consume 15 levels if successful and grant the caster a new life.
Transfering lives is much simpler, giving one life to the nearest player within a 5 block radius without requiring any levels.

### Crafting Recipes

#### Sacrifical Totem

![Redstone block, gold block, redstone block, gold ingot, ender pearl, gold ingot, empty, gold sword, empty](https://mc.kayt.dev/static/images/totem_crafting.png)

Because of the current crafting system, naturally acquired Totems of Undying will be replaced with Sacrifical Totems. Though if you're playing this in singleplayer this treads the line of being an intended feature so I won't treat it as a bug.

#### TNT

![default tnt recipe with paper replacing the sand](https://mc.kayt.dev/static/images/tnt_crafting.png)

#### Enchanting Table

As New Life is meant to be played in a small world border with more focus on PVP rather than resource-gathering, the default enchanting table recipe has been removed. Instead, it's common to place an enchanting table in a specific location (e.g. an ancient city).

### Custom Textures

#### Sacrifical Totem
![](https://mc.kayt.dev/static/images/sacrificial_totem.png)

#### Bedrock
![](https://mc.kayt.dev/static/images/bedrock.png)

This bedrock texture is taken from the [Vanilla Tweaks](https://vanillatweaks.net/picker/resource-packs/) alternate bedrock option. I chose to include it because bedrock makes a good block for constructing an unbreakable altar on a server.

### Advancements

Taste for Death - Kill another player

Fatality - Kill a red player while on your last life

Tomb Raider - Acquire the Ancient Spellbook

Premortal - Grant yourself a new life with a Sacrifical Totem

Collector's Edition - Reach at least five lives using Sacrifical Totems

Sharing is Caring - Give away one of your lives using the Spellbook