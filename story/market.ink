
=== market(->goback) ===

You are at the market.

Looking in your pouch you count {print_player_coins()}.

+ [Visit the parchmenter] -> parchmenter(goback)
+ [Back] -> goback

= parchmenter(->goback)

-> parchmenter_loop(goback, 0, 0)

= parchmenter_loop(->goback, shop_sheets, shop_rolls)

~ temp shop_total = shop_sheets + shop_rolls
~ temp shop_cost_sheets = parchmenter_price_parchment_sheets * shop_sheets
~ temp shop_cost_rolls = parchmenter_price_parchment_rolls * shop_rolls
~ temp shop_cost_total = shop_cost_sheets + shop_cost_rolls
~ temp available_coins = inventory_coins - shop_cost_total
{shop_total > 0:  
  You are going to buy:
  {shop_sheets > 0:
    {print_parchment_sheets(shop_sheets)}
    <> for <>
    {print_coins(shop_cost_sheets)}
  }

  {shop_rolls > 0:
    {print_parchment_sheets(shop_rolls)}
    <> for <>
    {print_coins(shop_cost_rolls)}
  }
  
  This totals to {print_coins(shop_cost_total)}.

  {
  -available_coins < 0: 
    But you are missing {print_coins(-available_coins)} to buy this.
  -available_coins > 0: 
    You have {print_num_unit(available_coins, "more coin", "more coins")} to spent.
  -available_coins == 0: 
    That is all the money you have.
  }
}

~ temp can_dec_sheets = shop_sheets > 0
~ temp can_inc_sheets = available_coins >= parchmenter_price_parchment_sheets

~ temp can_dec_rolls = shop_rolls > 0
~ temp can_inc_rolls = available_coins >= parchmenter_price_parchment_rolls

+ {can_dec_sheets} [One less sheet of parchment] -> parchmenter_loop(goback, shop_sheets-1, shop_rolls)
+ {can_inc_sheets} [One {shop_sheets>0:more} sheet of parchment for {print_coins(parchmenter_price_parchment_sheets)}] -> parchmenter_loop(goback, shop_sheets+1, shop_rolls)
+ {can_dec_rolls}  [One less roll of parchment] -> parchmenter_loop(goback, shop_sheets, shop_rolls-1)
+ {can_inc_rolls}  [One {shop_rolls>0:more} roll of parchment for {print_coins(parchmenter_price_parchment_rolls)}] -> parchmenter_loop(goback, shop_sheets, shop_rolls+1)
+ {shop_total > 0} [Check out] 
++ [Pay {print_coins(shop_cost_total)} to buy {print_parchment_sheets(shop_sheets)} and {print_parchment_sheets(shop_rolls)}] -> parchmenter_checkout(goback, shop_sheets, shop_rolls)
+ [Back] -> market(goback)

= parchmenter_checkout(->goback, shop_sheets, shop_rolls)

~ temp shop_cost_sheets = parchmenter_price_parchment_sheets * shop_sheets
~ temp shop_cost_rolls = parchmenter_price_parchment_rolls * shop_rolls
~ temp shop_cost_total = shop_cost_sheets + shop_cost_rolls
~ temp available_coins = inventory_coins - shop_cost_total

{shop_cost_total <= inventory_coins:
~ inventory_coins -= shop_cost_total
~ inventory_parchment_sheets += shop_sheets
~ inventory_parchment_rolls += shop_rolls
}

-> market(goback)
