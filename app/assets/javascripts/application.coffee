$ ->
  $(".channel-thumb").each (i, el) ->
    $.get "#{$(el).attr 'href'}/thumb", (data) ->
      $(el).parent().find(".inner").html data

  $(".channels").on "click", (e) ->
    e.preventDefault()

    $("#loading").show()
    $.get "#{$(this).attr 'href'}/channels", (data) =>
      $("#menu").show().html data
      # Should just return JSON here and use a template to construct the menu
      # $.each $(this).data('embeddedChannels'), (key, value) ->
      #   $("#menu").append value
      $("#loading").hide()

  $("#menu").on "click", (e) -> $(this).hide()
    