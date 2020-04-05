#
# authorizable
#

# - start with given values
auth_types = $('#authority_authorizable_type').find("option:selected").val()
$('#authority_authorizable_id optgroup').find('option').addBack().attr("disabled", true)
$("#authority_authorizable_id optgroup[label=\"#{auth_types}\"]").find('option').addBack().attr("disabled", false)

# - redisplay on change
$(document).on('click', '#authority_authorizable_type', ->
  type = $(this).find("option:selected").val()
  $('#authority_authorizable_id optgroup').find('option').addBack().attr("disabled", true)
  $("#authority_authorizable_id optgroup[label=\"#{type}\"]").find('option').addBack().attr("disabled", false)
)

#
# authorized_for
#

# - start with given values
authfor_type = $('#authority_authorized_for_type').find("option:selected").val()
$('#authority_authorized_for_id optgroup').find('option').addBack().attr("disabled", true)
$("#authority_authorized_for_id optgroup[label=\"#{authfor_type}\"]").find('option').addBack().attr("disabled", false)

# - redisplay on change
$(document).on('click', '#authority_authorized_for_type', ->
  type = $(this).find("option:selected").val()
  $('#authority_authorized_for_id optgroup').find('option').addBack().attr("disabled", true)
  $("#authority_authorized_for_id optgroup[label=\"#{type}\"]").find('option').addBack().attr("disabled", false)
)
