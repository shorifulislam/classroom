App.exit_room = App.cable.subscriptions.create "ExitRoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    Alert "La classe compte un élève de moins"
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
