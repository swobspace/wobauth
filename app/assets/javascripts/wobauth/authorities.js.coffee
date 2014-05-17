$('#authority_authorizable_id optgroup').find('option').andSelf().hide()
$(document).on('click', '#authority_authorizable_type', ->
  type = $(this).find("option:selected").val()
  # alert(type)
  $('#authority_authorizable_id optgroup').find('option').andSelf().hide()
  $("#authority_authorizable_id optgroup[label=\"#{type}\"]").find('option').andSelf().show()
)
$('#authority_authorized_for_id optgroup').find('option').andSelf().hide()
$(document).on('click', '#authority_authorized_for_type', ->
  type = $(this).find("option:selected").val()
  # alert(type)
  $('#authority_authorized_for_id optgroup').find('option').andSelf().hide()
  $("#authority_authorized_for_id optgroup[label=\"#{type}\"]").find('option').andSelf().show()
)
