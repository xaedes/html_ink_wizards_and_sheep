
=== game_loop ===

-> begin

= begin

-> inventory.show(->game_loop.choices)

= choices

+ [Go to market] -> market(->game_loop)
+ [Continue] -> game_loop
+ [Back to Main Menu] -> main_menu

-> game_loop
