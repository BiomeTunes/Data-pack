# Hard reset ambient if not smooth transition
execute as @s[tag=!smoothTransition] run tag @s remove playingAmbient
execute as @s[tag=!smoothTransition] run stopsound @s ambient

# Set biome variable to plains
scoreboard players set @s biomeAmbient 16

# Set ambient time
scoreboard players set @s[tag=!playingAmbient] ambientTimer 360

# Reset all advancements and music
function biometunes:triggers/reset