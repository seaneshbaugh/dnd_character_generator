_stats = [0, 0, 0, 0, 0, 0]

rollStandard = ->
  _stats = [
    Helpers.Dice.roll("4d6k3")
    Helpers.Dice.roll("4d6k3")
    Helpers.Dice.roll("4d6k3")
    Helpers.Dice.roll("4d6k3")
    Helpers.Dice.roll("4d6k3")
    Helpers.Dice.roll("4d6k3")
  ]

  adjustStats(13, 1)

roll5d6k3 = ->
  _stats = [
    Helpers.Dice.roll("5d6k3")
    Helpers.Dice.roll("5d6k3")
    Helpers.Dice.roll("5d6k3")
    Helpers.Dice.roll("5d6k3")
    Helpers.Dice.roll("5d6k3")
    Helpers.Dice.roll("5d6k3")
  ]

  adjustStats(15, 2)

rollEliteArray = ->
  _stats = [15, 14, 13, 12, 10, 8]

rollPointBuy = ->
  _stats = [8, 8, 8, 8, 8, 8]

rollNonEliteArray = ->
  _stats = [13, 12, 11, 10, 9, 8]

rollOriginal3d6 = ->
  _stats = [
    Helpers.Dice.roll("3d6")
    Helpers.Dice.roll("3d6")
    Helpers.Dice.roll("3d6")
    Helpers.Dice.roll("3d6")
    Helpers.Dice.roll("3d6")
    Helpers.Dice.roll("3d6")
  ]

  adjustStats(12, 0)

rollSimpleEntry = ->
  _stats = [0, 0, 0, 0, 0, 0]

rollLowPowerCampaign = ->
  rollForCampaign(15, 21)

rollEasyCampaign = ->
  rollForCampaign(22, 24)

rollStandardCampaign = ->
  rollForCampaign(25, 27)

rollTougherCampaign = ->
  rollForCampaign(28, 31)

rollHighPowerCampaign = ->
  rollForCampaign(32, Infinity)

adjustStats = (statMinimum, modifierSumMinimum) ->
  if _stats.every((stat) -> stat < statMinimum)
    _stats[_stats.length - 1] = statMinimum

  if modifierSum() < modifierSumMinimum
    loop
      raiseRandomStat()

      unless modifierSum() < modifierSumMinimum
        break

modifierSum = ->
  _stats.reduce ((sum, stat) ->
    sum + modifierNumber(stat)
  ), 0

modifierNumber = (stat) ->
  if stat < 2
    -5
  else if stat < 4
    -4
  else if stat < 6
    -3
  else if stat < 8
    -2
  else if stat < 10
    -1
  else
    Math.floor((stat - 10) / 2)

raiseRandomStat = ->
  index = Math.floor(_stats.length * Math.random())

  if _stats[index] < 18
    _stats[index] += 1

rollForCampaign = (minimumPointBuy, maximumPointBuy) ->
  loop
    _stats = [
      Helpers.Dice.roll("4d6k3")
      Helpers.Dice.roll("4d6k3")
      Helpers.Dice.roll("4d6k3")
      Helpers.Dice.roll("4d6k3")
      Helpers.Dice.roll("4d6k3")
      Helpers.Dice.roll("4d6k3")
    ]

    ensureMinimum(8)

    sum = pointBuySum()

    unless sum < minimumPointBuy || sum > maximumPointBuy
      break

ensureMinimum = (minimum) ->
  i = 0

  while i < _stats.length
    if _stats[i] < minimum
      _stats[i] = minimum

    i += 1

pointBuySum = ->
  _stats.reduce ((sum, stat) ->
    sum + pointBuy(stat)
  ), 0

pointBuy = (stat) ->
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

window.Helpers or= {}

window.Helpers.StatGenerator =
  roll: (mode) ->
    throw "invalid mode" if @modes.hasOwnProperty(mode) == -1

    _stats = [0, 0, 0, 0, 0, 0]

    @modes[mode]()

    _stats

  modes:
    "standard": rollStandard
    "5d6k3": roll5d6k3
    "elite-array": rollEliteArray
    "point-buy": rollPointBuy
    "non-elite-array": rollNonEliteArray
    "original-3d6": rollOriginal3d6
    "simple-entry": rollSimpleEntry
    "low-power-campaign": rollLowPowerCampaign
    "easy-campaign": rollEasyCampaign
    "standard-campaign": rollStandardCampaign
    "tougher-campaign": rollTougherCampaign
    "high-power-campaign": rollHighPowerCampaign
