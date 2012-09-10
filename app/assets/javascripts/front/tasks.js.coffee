$ ->
  # Focus on first element
  focus_selected()

window.show_slide = (direction) ->
  focus_selected()
  $('ul.task-list').show('slide', { direction: direction }, 150)

window.hide_slide = (direction) ->
  $(".selected input[type='text']").trigger('change')
  $('ul.task-list').hide('slide', { direction: direction }, 150)
     
window.new_step_success = ->
  $('.task-list li.selected').removeClass('selected');
  $('.task-list li.new-step').addClass('selected');
  focus_selected()

window.new_task_success = ->
  $('#task_description').focus()

window.focus_selected = ->
  $('.task-list li.selected .text-input').focus();

window.select_step = (id) ->
  $('.task-list li.selected').removeClass('selected');
  dom_id = "#step_#{id}"
  element = $(dom_id);
  element.addClass('selected');
  focus_selected()
  
  
# Workaround for spinner bug
$.fn.hjq_spinner = ->
  # Do nothing!
