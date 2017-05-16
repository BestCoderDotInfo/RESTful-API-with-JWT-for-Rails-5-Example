App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#comments-at-room' + data['room']).append data['comment']
    if data['receive_user'] != null && data['sender_user'] != null
      html = '<a href="/users/'+data['sender_user']+'/message">You have new message</a>'
      $('#notification-'+ data['receive_user']).append html

  speak: (data) ->
    @perform 'speak', data: data


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return/enter = send
    comment = event.target.value
    user = $('[data-behavior~=current_user]').val()
    room = $('[data-behavior~=room_chat]').val()
    data = {uid: user, comment: comment, room: room}
    App.room.speak data
    event.target.value = ''
    event.preventDefault()
