INCLUDE common_functions.ink
INCLUDE print_functions.ink
INCLUDE main_menu.ink
INCLUDE game_loop.ink
INCLUDE prolog.ink
INCLUDE market.ink
INCLUDE inventory.ink

VAR inventory_coins = 100
VAR inventory_books = 0
VAR inventory_parchment_sheets = 0
VAR inventory_parchment_rolls = 0

VAR parchmenter_inventory_coins = 100
VAR parchmenter_inventory_parchment_sheets = 100
VAR parchmenter_inventory_parchment_rolls = 100

VAR parchmenter_price_parchment_sheets = 1
VAR parchmenter_price_parchment_rolls = 10

#-> game_loop
-> main_menu
