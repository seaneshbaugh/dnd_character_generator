window.Helpers or= {}

window.Helpers.PointBuy =
  pointBuySum: (stats) ->
    stats.reduce ((sum, stat) ->
      sum + window.Helpers.PointBuy.pointBuy(stat)
    ), 0

  pointBuy: (stat) ->
    if stat < 9
      0
    else if stat == 9
      1
    else if stat == 10
      2
    else if stat == 11
      3
    else if stat == 12
      4
    else if stat == 13
      5
    else if stat == 14
      6
    else if stat == 15
      8
    else if stat == 16
      10
    else if stat == 17
      13
    else if stat == 18
      16
    else
      throw "stat must be less than or equal to 18"
