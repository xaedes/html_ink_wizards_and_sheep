// print with unit 

=== function print_coins(amount) ===
{print_num_unit(amount, "coin", "coins")}

=== function print_books(amount) ===
{print_num_unit(amount, "book", "books")}

=== function print_parchment_sheets(amount) ===
{print_num_unit(amount, "sheet", "sheets")} of parchment

=== function print_parchment_rolls(amount) ===
{print_num_unit(amount, "roll", "rolls")} of parchment


// print player stats

=== function print_player_coins() ===
{print_coins(inventory_coins)}

=== function print_player_books() ===
{print_books(inventory_books)}

=== function print_player_parchment_sheets() ===
{print_parchment_sheets(inventory_parchment_sheets)}

=== function print_player_parchment_rolls() ===
{print_parchment_rolls(inventory_parchment_rolls)}


