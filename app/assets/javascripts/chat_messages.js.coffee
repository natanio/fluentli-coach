window.client = new Faye.Client('/faye')

client.addExtension {
  outgoing: (message, callback) ->
    message.ext = message.ext || {}
    message.ext.csrfToken = $('meta[name=csrf-token]').attr('content')
    callback(message)
}

jQuery ->
  try
    client.unsubscribe '/chat_messages'
  catch
    console?.log "Can't unsubscribe."

  client.subscribe '/chat_messages', (payload) ->
    $('#chat_messages').find('.messages-list').append(payload.message) if payload.message

  $('#new_message').submit -> $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)