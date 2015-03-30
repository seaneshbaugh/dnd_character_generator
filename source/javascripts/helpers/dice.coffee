window.Helpers or= {}

window.Helpers.Dice =
  roll: ->
    if arguments.length == 0
      throw "roll requires either one, two, or three arguments"

    if arguments.length == 1
      if typeof arguments[0] == "string"
        matches = arguments[0].match(/^((([1-9][0-9]*)(d[1-9][0-9]*)(k[1-9][0-9]*))|(([1-9][0-9]*)(d[1-9][0-9]*))|(d[1-9][0-9]*))$/)

        throw "roll string argument must match standard dice roll notation" unless matches

        if matches[2]
          rolls = parseInt(matches[3]);

          sides = parseInt(matches[4].replace("d", ""));

          keep = parseInt(matches[5].replace("k", ""));
        else
          if matches[6]
            rolls = parseInt(matches[7]);

            sides = parseInt(matches[8].replace("d", ""));

            keep = rolls
          else
            rolls = 1

            sides = parseInt(matches[9].replace("d", ""));

            keep = 1
      else
        if typeof arguments[0] == "number"
          rolls = 1

          sides = arguments[0]

          keep = 1
        else
          if typeof arguments[0] == "object" and arguments[0].hasOwnProperty("sides")
            rolls = arguments[0].rolls or 1

            sides = arguments[0].sides

            keep = arguments[0].keep or rolls
          else
            throw "roll requires at least a \"sides\" property on object arguments"
    else
      if arguments.length == 2
        rolls = arguments[0]

        sides = arguments[1]

        keep = rolls
      else
        if arguments.length == 3
          rolls = arguments[0]

          sides = arguments[1]

          keep = arguments[2]

    results = []

    i = 0

    while i < rolls
      results.push Math.floor(sides * Math.random() + 1)

      i += 1

    sum = 0

    i = 0

    if keep != rolls
      results.sort (a, b) ->
        b - a

    while i < keep
      sum += results[i]

      i += 1

    sum
