App.game = App.cable.subscriptions.create "GameChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log "connected"

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log "disconnected"

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if !data.hasOwnProperty("action") || !data.hasOwnProperty("room") || data["room"] != room
      return
    switch data["action"]
      when "move"
        p = otherPlayers.find((x) -> x.id == data["id"])
        if p?
          p.position.x = data["pos"].x
          p.position.y = data["pos"].y
      when "join"
        p = otherPlayers.find((x) -> x.id == data["id"])
        if !p?
          newPlayer(data["id"], data["pos"].x, data["pos"].y)

  movePlayer: (data) ->
    @perform("move", data)
