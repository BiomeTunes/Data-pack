

# Enable all players to always trigger option menu
scoreboard players enable @a biomeTunes
scoreboard players enable @a opt1
scoreboard players enable @a opt2
scoreboard players enable @a opt3
scoreboard players enable @a opt4

## Detect menu trigger and setup control panel

# Display error if pack has not been setup
execute as @a[scores={biomeTunes=1..}] run execute unless score #bt_instantiated bt_pack_vars matches 1 run tellraw @s ["",{"text":"ERROR: ","color":"red","bold":true},{"text":"Pack has not been setup. Run ","color":"red","bold":false},{"text":"/function #biometunes:setup","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function #biometunes:setup"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Run it","color":"green"}]}}}] 

# Display control panel
execute as @a[scores={biomeTunes=1..}] run tellraw @s ["",{"text":"BiomeTunes settings panel","bold":true,"color":"dark_green"},{"text":"\n"},{"text":"Smooth transitions: ","color":"dark_gray"},{"text":"[on] ","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger opt1 set 1"},"hoverEvent":{"action":"show_text","value":["",{"text":"Wait for a song to end before swapping soundtrack","color":"green"}]}},{"text":"[off]","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger opt1 set 2"},"hoverEvent":{"action":"show_text","value":["",{"text":"Cut straight to the new biome music","color":"red"}]}},{"text":"\n"},{"text":"Biome shift notification: ","color":"dark_gray","hoverEvent":{"action":"show_text","value":["",{"text":"Get a notification when entering a new biome","color":"dark_gray"}]}},{"text":"[on] ","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger opt2 set 1"},"hoverEvent":{"action":"show_text","value":["",{"text":"Turn on biome notifications","color":"green"}]}},{"text":"[off]","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger opt2 set 2"},"hoverEvent":{"action":"show_text","value":["",{"text":"Turn off biome notifications","color":"red"}]}},{"text":"\n"},{"text":"Boss music: ","color":"dark_gray","hoverEvent":{"action":"show_text","value":[""]}},{"text":"[on] ","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger opt4 set 1"},"hoverEvent":{"action":"show_text","value":["",{"text":"Enable boss music","color":"green"}]}},{"text":"[off]","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger opt4 set 2"},"hoverEvent":{"action":"show_text","value":["",{"text":"Disable boss music","color":"red"}]}},{"text":"\n"},{"text":"Boss notifications: ","color":"dark_gray","hoverEvent":{"action":"show_text","value":["",{"text":"Get a notification when entering a boss battle","color":"dark_gray"}]}},{"text":"[on] ","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger opt3 set 1"},"hoverEvent":{"action":"show_text","value":["",{"text":"Enable boss notifications","color":"green"}]}},{"text":"[off]","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger opt3 set 2"},"hoverEvent":{"action":"show_text","value":["",{"text":"Disable boss notifications","color":"red"}]}}]

# Reset menu trigger
execute as @a[scores={biomeTunes=1..}] run scoreboard players set @s biomeTunes 0

# Manage options (1 is on, 2 is off)
execute as @a[scores={opt1=1}] run tag @s add smoothTransition
execute as @a[scores={opt1=2}] run tag @s remove smoothTransition
execute as @a[scores={opt1=1..}] run tellraw @s ["",{"text":"Smooth Transition option updated!","color":"dark_green"}]
execute as @a[scores={opt1=1..}] run scoreboard players reset @s opt1

execute as @a[scores={opt2=1}] run tag @s add receiveBiomeMsg
execute as @a[scores={opt2=2}] run tag @s remove receiveBiomeMsg
execute as @a[scores={opt2=1..}] run tellraw @s ["",{"text":"Biome shift notification option updated!","color":"dark_green"}]
execute as @a[scores={opt2=1..}] run scoreboard players reset @s opt2

execute as @a[scores={opt3=1}] run tag @s add receiveBossMsg
execute as @a[scores={opt3=2}] run tag @s remove receiveBossMsg
execute as @a[scores={opt3=1..}] run tellraw @s ["",{"text":"Boss battle message option updated!","color":"dark_green"}]
execute as @a[scores={opt3=1..}] run scoreboard players reset @s opt3

execute as @a[scores={opt4=1}] run tag @s remove noBossBattleMusic
execute as @a[scores={opt4=2}] run tag @s add noBossBattleMusic
execute as @a[scores={opt4=1..}] run tellraw @s ["",{"text":"Boss battle option updated!","color":"dark_green"}]
execute as @a[scores={opt4=1..}] run scoreboard players reset @s opt4

# Minecraft json import code
# {"jformat":6,"jobject":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"dark_green","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"37272bd3-d978-44ff-b10a-0b8c8c387a8c","text":"BiomeTunes settings panel"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"aaa1e7b9-e395-4785-bd8c-981f5ca33831","text":"\n"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"dark_gray","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"cd10173f-ffe6-4603-a00a-f6ab1b56d160","text":"Smooth transitions: "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":"2","click_event_value":"/trigger opt1 set 1","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"3b2ca5e6-49dd-4273-88fe-37a10080d03b","text":"Wait for a song to end before swapping soundtrack"}],"id":"d6aee648-50c2-4fab-ba42-390a8a3e57f2","text":"[on] "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"2","click_event_value":"/trigger opt1 set 2","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"710ce0f6-6e0c-4f78-baab-cd55685a86ff","text":"Cut straight to the new biome music"}],"id":"6528fb35-606f-4281-9d64-6e3bb43c64da","text":"[off]"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"2c503b7a-b301-41a9-86ab-89a0cbd782fa","text":"\n"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"dark_gray","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"dark_gray","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"e50fadd7-8d19-4350-b9e9-4c11a443ab11","text":"Get a notification when entering a new biome"}],"id":"b3a43bfb-cc2f-4755-a88b-a0ea68b18988","text":"Biome shift notification: "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":"2","click_event_value":"/trigger opt2 set 1","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"2c9e95ad-11e8-431a-a3f1-9651fc1e9f8a","text":"Turn on biome notifications"}],"id":"30083d73-5a93-4796-bc1f-9e77f496a355","text":"[on] "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"2","click_event_value":"/trigger opt2 set 2","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"017bf66d-e441-4cfd-aec4-f197dbec6e59","text":"Turn off biome notifications"}],"id":"7c5a062e-dd23-448e-8e27-2ba8772fbaab","text":"[off]"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"e618e202-0d0f-4466-92fc-202ffb0ad0e0","text":"\n"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"dark_gray","insertion":"","click_event_type":"0","click_event_value":"","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"aad3e8ac-0925-45c9-bacc-2a2455665d51","text":"Boss music: "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":"2","click_event_value":"/trigger opt4 set 1","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"6dbb815a-63d7-45b5-9a90-880ec4674a35","text":"Enable boss music"}],"id":"f5d26426-4403-4edf-babe-4925242a79ae","text":"[on] "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"2","click_event_value":"/trigger opt4 set 2","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"5bcedd02-4b00-4214-902b-ff402b88966b","text":"Disable boss music"}],"id":"759713db-1be3-4461-9d82-3c4e122f3442","text":"[off]"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"1b5c36a9-18c4-4d96-9188-27a78f5f196a","text":"\n"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"dark_gray","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"dark_gray","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"8a6a008e-9b64-4ed6-9fad-775e391d1438","text":"Get a notification when entering a boss battle"}],"id":"5b900838-ec16-4888-ada7-104e81dcfadc","text":"Boss notifications: "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":"2","click_event_value":"/trigger opt3 set 1","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"d448f632-642d-4ff5-885a-e9d5cab5b39b","text":"Enable boss notifications"}],"id":"0a07c3c4-f5d9-4f44-9ab2-eeeccadb65cd","text":"[on] "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"2","click_event_value":"/trigger opt3 set 2","hover_event_type":"1","hover_event_value":"","hover_event_object":{},"hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":0,"click_event_value":"","hover_event_type":0,"hover_event_value":"","hover_event_object":{},"hover_event_children":[],"id":"64acc696-cd46-4949-8e5b-923d1a326496","text":"Disable boss notifications"}],"id":"8980d586-c751-4c34-9286-dc51cb65143c","text":"[off]"}],"command":"/tellraw @p %s","jtemplate":"tellraw"}