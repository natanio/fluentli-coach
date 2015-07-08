window.client = new Faye.Client('/faye')

jQuery ->
  client.subscribe '/comments', (payload) ->
    $('#comments').find('media-list').prepend(payload.message) if payload.message

    $('#new_comment').submit -> $(this).find("input[type='submit']").value('Sending...').prop('disabled', true)