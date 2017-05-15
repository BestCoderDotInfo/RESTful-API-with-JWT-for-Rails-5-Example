App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#comments').append data['comment']

  speak: (data) ->
    @perform 'speak', data: data


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return/enter = send
    comment = event.target.value
    user = $('[data-behavior~=current_user]').val()
    data = {uid: user, comment: comment}
    App.room.speak data
    event.target.value = ''
    event.preventDefault()
