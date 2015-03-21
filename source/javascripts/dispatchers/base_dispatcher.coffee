_lastID = 1

_prefix = "ID_"

class BaseDispatcher
  constructor: ->
    @_callbacks = {}

    @_isPending = {}

    @_isHandled = {}

    @_isDispatching = false

    @_pendingPayload = null

    return

  register: (callback) ->
    id = _prefix + _lastID

    _lastID += 1

    @_callbacks[id] = callback

    id

  unregister: (id) ->
    invariant @_callbacks[id], "Dispatcher.unregister(...): `%s` does not map to a registered callback.", id

    delete @_callbacks[id]

    return

  waitFor: (ids) ->
    invariant @_isDispatching, "Dispatcher.waitFor(...): Must be invoked while dispatching."

    i = 0

    while i < ids.length
      id = ids[i]

      if @_isPending[id]
        invariant @_isHandled[id], "Dispatcher.waitFor(...): Circular dependency detected while waiting for `%s`.", id

        i += 1

        continue

      invariant @_callbacks[id], "Dispatcher.waitFor(...): `%s` does not map to a registered callback.", id

      @_invokeCallback id

      i += 1

    return

  dispatch: (payload) ->
    invariant !@_isDispatching, "Dispatch.dispatch(...): Cannot dispatch in the middle of a dispatch."

    @_startDispatching payload

    try
      for id of @_callbacks
        if @_isPending[id]
          continue

        @_invokeCallback id
    finally
      @_stopDispatching()
    return

  isDispatching: ->
    @_isDispatching

  _invokeCallback: (id) ->
    @_isPending[id] = true

    @_callbacks[id] @_pendingPayload

    @_isHandled[id] = true

    return

  _startDispatching: (payload) ->
    for id of @_callbacks
      @_isPending[id] = false

      @_isHandled[id] = false

    @_pendingPayload = payload

    @_isDispatching = true

    return

  _stopDispatching: ->
    @_pendingPayload = null

    @_isDispatching = false

    return

window.BaseDispatcher = BaseDispatcher
