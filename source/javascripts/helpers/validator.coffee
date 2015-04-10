window.Helpers or= {}

isNil = (object) ->
  object == null or object == undefined

isEmptyObject = (object) ->
  for name of object
    return false

  true

isBlank = (object) ->
  isNil(object) or isEmptyObject(object)  or (toString.call(object) == "[object string]" and object.trim() == "")

verifyAllRequiredOptionsPresent = (options) ->
  requiredOptions = Array.prototype.slice.call(arguments, 1, arguments.length)

  throw "no required options passed" if requiredOptions.length == 0

  missingOptions = []

  i = 0

  while i < requiredOptions.length
    missingOptions.push(requiredOptions[i]) unless options.hasOwnProperty(requiredOptions[i])

    i += 1

  if missingOptions.length == 1
    throw "missing required option \"#{missingOptions[0]}\""
  else if missingOptions.length > 1
    throw "missing required options \"#{missingOptions.join("\", \"")}\""

  true

verifyAtLeastOneRequiredOptionPresent = (options) ->
  requiredOptions = Array.prototype.slice.call(arguments, 1, arguments.length)

  throw "no required options passed" if requiredOptions.length == 0

  missingOptions = true

  i = 0

  while i < requiredOptions.length and missingOptions
    missingOptions = false if options.hasOwnProperty(requiredOptions[i])

    i += 1

  if missingOptions
    if requiredOptions.length < 3
      throw "requires either a \"#{requiredOptions.join("\" or \"")}\" option"
    else
      throw "requires either a \"#{requiredOptions.slice(0, requiredOptions.length - 1).join("\", \"")}\", or #{requiredOptions[requiredOptions.length - 1]}\" option"

  true

verifyNoMutuallyExclusiveOptions = (options) ->
  mutuallyExclusiveOptions = Array.prototype.slice.call(arguments, 1, arguments.length)

  throw "no mutually exclusive options passed" if mutuallyExclusiveOptions.length == 0

  optionsFound = []

  i = 0

  while i < mutuallyExclusiveOptions.length
    optionsFound.push(mutuallyExclusiveOptions[i]) if options.hasOwnProperty(mutuallyExclusiveOptions[i])

    i += 1

  if optionsFound.length == 2
    throw "called with both \"#{optionsFound[0]}\" and \"#{optionsFound[1]}\" options"
  else if optionsFound.length > 2
    throw "called with \"#{optionsFound.slice(0, optionsFound.length - 1).join("\", \"")}\", and \"#{optionsFound[optionsFound.length - 1]}\" options"

  true

verifyOptionTypes = (options, requiredOptions) ->
  invalidTypeErrors = []

  for optionName, optionTypes of requiredOptions
    if options.hasOwnProperty(optionName)
      unless toString.call(optionTypes) == "[object Array]"
        optionTypes = [optionTypes]

      invalidType = true

      i = 0

      while i < optionTypes.length and invalidType
        invalidType = false if toString.call(options[optionName]) == "[object #{optionTypes[i]}]"

        i += 1

      if invalidType
        if optionTypes.length < 3
          invalidTypeErrors.push("option \"#{optionName}\" must be a #{optionTypes.join(" or ")}")
        else
          invalidTypeErrors.push("option \"#{optionName}\" must be a #{optionTypes.slice(0, optionTypes.length - 1).join(", ")}, or #{optionTypes[optionTypes.length - 1]}")

  if invalidTypeErrors.length != 0
    if invalidTypeErrors.length < 3
      throw invalidTypeErrors.join(" and ")
    else
      throw "#{invalidTypeErrors.slice(0, invalidTypeErrors.length - 1).join(", ")}, and #{invalidTypeErrors[invalidTypeErrors.length - 1]}"

  true

window.verifyOptionTypes = verifyOptionTypes

window.Helpers.Validator =
  validate: ->
    @errors = []

    for property, types of @validators
      for type, validator of types
        validator.callback()

    @errors

  isValid: (property) ->
    @validate()

    if property != undefined and @hasOwnProperty(property)
      @errors.filter((error) -> error.property == property).length == 0
    else
      @errors.length == 0

  fullErrorMessages: ->
    @validate()

    @errors.map (error) ->
      error.property + " " + error.message

  validateExclusionOf: (property, options) ->
    verifyAllRequiredOptionsPresent(options, "in")

    # throw "missing required option \"in\"" if !options.hasOwnProperty("in")

    verifyOptionTypes(options, { "in": ["Array", "Object"] })

    # throw "option \"in\" must be an Array or an Object" if ["[object Array]", "[object Object]"].indexOf(toString.call(options.in)) == -1

    @_addValidator
      property: property
      type: "exclusion"
      options: options
      callback: =>
        return if options.allowNil and isNil(this[property])

        return if options.allowBlank and isBlank(this[property])

        if toString.call(options.in) == "[object Array]"
          values = options.in
        else
          values = []

          for _property, value of options.in
            values.push value

        if values.indexOf(this[property]) != -1
          @errors.push
            property: property
            type: "exclusion"
            message: "is reserved"

  validateFormatOf: (property, options) ->
    verifyAtLeastOneRequiredOptionPresent(options, "with", "without")

    # throw "requires either a \"with\" or \"without\" option" if !options.hasOwnProperty("with") and !options.hasOwnProperty("without")

    verifyNoMutuallyExclusiveOptions(options, "with", "without")

    # throw "called with both \"with\" and \"without\" options" if options.hasOwnProperty("with") and options.hasOwnProperty("without")

    # This is required because we can't make literal objects with a "with" property.
    optionTypes = {}

    optionTypes.with = "RegExp"

    optionTypes.without = "RegExp"

    verifyOptionTypes(options, optionTypes)

    # throw "option \"with\" must be a RegExp" of options.hasOwnProperty("with") and toString.call(options.with) != "[object RegExp]"

    # throw "option \"without\" must be a RegExp" of options.hasOwnProperty("without") and toString.call(options.without) != "[object RegExp]"

    @_addValidator
      property: property
      type: "format"
      options: options
      callback: =>
        return if options.allowNil and isNil(this[property])

        return if options.allowBlank and isBlank(this[property])

        if options.hasOwnProperty("with")
          if !options.with.test(this[property])
            @errors.push
              property: property
              type: "format"
              message: "is invalid"
        else
          if options.without.test(this[property])
            @errors.push
              property: property
              type: "format"
              message: "is invalid"

  validateInclusionOf: (property, options) ->
    verifyAllRequiredOptionsPresent(options, "in")

    # throw "missing required option \"in\"" if !options.hasOwnProperty("in")

    verifyOptionTypes(options, { "in": ["Array", "Object"] })

    # throw "option \"in\" must be an Array or an Object" if ["[object Array]", "[object Object]"].indexOf(toString.call(options.in)) == -1

    @_addValidator
      property: property
      type: "inclusion"
      options: options
      callback: =>
        return if options.allowNil and isNil(this[property])

        return if options.allowBlank and isBlank(this[property])

        if toString.call(options.in) == "[object Array]"
          values = options.in
        else
          values = []

          for _property, value of options.in
            values.push value

        if values.indexOf(this[property]) == -1
          @errors.push
            property: property
            type: "inclusion"
            message: "is not included in the list"

  validateLengthOf: (property, options) ->
    options or= {}

    verifyAtLeastOneRequiredOptionPresent(options, "minimum", "maximum", "is", "in")

    # throw "requires either a \"minimum\", \"maximum\", or \"is\" option" if !options.hasOwnProperty("minimum") and !options.hasOwnProperty("maximum") and !options.hasOwnProperty("is")

    verifyNoMutuallyExclusiveOptions(options, "minimum", "is")

    # throw "called with both \"minimum\" and \"is\" options" if options.hasOwnProperty("minimum") and options.hasOwnProperty("is")

    verifyNoMutuallyExclusiveOptions(options, "maximum", "is")

    # throw "called with both \"maximum\" and \"is\" options" if options.hasOwnProperty("maximum") and options.hasOwnProperty("is")

    verifyNoMutuallyExclusiveOptions(options, "minimum", "in")

    # throw "called with both \"minimum\" and \"in\" options" if options.hasOwnProperty("maximum") and options.hasOwnProperty("in")

    verifyNoMutuallyExclusiveOptions(options, "maximum", "in")

    # throw "called with both \"maximum\" and \"in\" options" if options.hasOwnProperty("maximum") and options.hasOwnProperty("in")

    verifyNoMutuallyExclusiveOptions(options, "in", "is")

    # throw "called with both \"in\" and \"is\" options" if options.hasOwnProperty("in") and options.hasOwnProperty("is")

    verifyOptionTypes(options, { "in": ["Array", "Object"] })

    # throw "option \"in\" must be an Array or an Object" if ["[object Array]", "[object Object]"].indexOf(toString.call(options.in)) == -1

    @_addValidator
      property: property
      type: "length"
      options: "options"
      callback: =>
        return if options.allowNil and isNil(this[property])

        return if options.allowBlank and isBlank(this[property])

        if !this[property].hasOwnProperty("length")
          @errors.push
            property: property
            type: "length"
            message: "does not have a length"
        else if options.minimum
          if this[property].length < options.minimum
            @errors.push
              property: property
              type: "length"
              message: "is too short"
        else if options.maximum
          if this[property].length > options.maximum
            @errors.push
              property: property
              type: "length"
              message: "is too long"
        else if options.is
          if this[property].length != Number(options.is)
            @errors.push
              property: property
              type: "length"
              message: "is the wrong length"
        else if options.in
          if toString.call(options.in) == "[object Array]"
            values = options.in
          else
            values = []

            for _property, value of options.in
              values.push value

          if values.indexOf(this[property].length) == -1
            @errors.push
              property: property
              type: "length"
              message: "is not included in the list"

  validateNumericalityOf: (property, options) ->
    @_addValidator
      property: property
      type: "numericality"
      options: options
      callback: =>
        return if options.allowNil and isNil(this[property])

        return if options.allowBlank and (this[property] == null or this[property] == undefined or (toString.call(this[property]) == "[object string]" and this[property].trim() == "") or this[property] == [])

        if typeof this[property] != "number"
          @errors.push
            property: property
            type: "numericality"
            message: "is not a number"
        else if options.isInteger
          if Number(this[property]) != this[property] or this[property] % 1 != 0
            @errors.push
              property: property
              type: "numericality"
              message: "is not an integer"
        else if options.greaterThan
          if this[property] <= options.greaterThan
            @errors.push
              property: property
              type: "numericality"
              message: "must be greater than #{options.greaterThan}"
        else if options.greaterThanOrEqualTo
          if this[property] < options.greaterThanOrEqualTo
            @errors.push
              property: property
              type: "numericality"
              message: "must be greater than or equal to #{options.greaterThanOrEqualTo}"
        else if options.equalTo
          if this[property] != options.equalTo
            @errors.push
              property: property
              type: "numericality"
              message: "must be equal to #{options.equalTo}"
        else if options.lessThan
          if this[property] >= options.lessThan
            @errors.push
              property: property
              type: "numericality"
              message: "must be greater than or equal to #{options.lessThan}"
        else if options.lessThanOrEqualTo
          if this[property] > options.lessThanOrEqualTo
            @errors.push
              property: property
              type: "numericality"
              message: "must be less than or equal to #{options.lessThanOrEqualTo}"
        else if options.odd
          if this[property] % 2 != 1
            @errors.push
              property: property
              type: "numericality"
              message: "must be odd"
        else if options.even
          if this[property] % 2 != 0
            @errors.push
              property: property
              type: "numericality"
              message: "must be even"

  validatePresenceOf: (property, options) ->
    @_addValidator
      property: property
      type: "presence"
      options: options
      callback: =>
        if isBlank(this[property])
          @errors.push
            property: property
            type: "presence"
            message: "must be present"

  _addValidator: (validator) ->
    @validators or= {}

    @validators[validator.property] or= {}

    @validators[validator.property][validator.type] = validator
