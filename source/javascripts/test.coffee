class Rofl
  constructor: (wut) ->
    @wut = wut

  lol: () ->
    "rofl #{@wut}"

  @defaultRofl = () ->
    new Rofl("wut")
