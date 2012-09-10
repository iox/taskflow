$ ->
  # Focus on first element
  focus_selected()


window.show_slide = (direction) ->
  focus_selected()
  $('ul.task-list').show('slide', { direction: direction }, 150)

window.hide_slide = (direction) ->
  $('ul.task-list').hide('slide', { direction: direction }, 150)
     
window.new_step_success = ->
  $('.task-list li.selected').removeClass('selected');
  $('.task-list li.new-step').addClass('selected');
  focus_selected()

window.new_task_success = ->
  $('#task_description').focus()

window.focus_selected = ->
  $('.task-list li.selected .text-input').focus();
  
  
# Workaround for spinner bug
$.fn.hjq_spinner = ->
  # Do nothing!
