$ ->
  # Handle keyboard events
  $(document).keypress (e) ->
    #console.log "keyCode: #{e.keyCode}"
    #console.log "charCode: #{e.charCode}"

    if (e.keyCode == 9 && e.shiftKey) # SHIFT + TAB key
      jump_task(e, true)
    else if (e.keyCode == 9) # TAB key
      jump_task(e, false)
    else if (e.keyCode == 40 && e.shiftKey) # SHIFT + Down arrow
      move_down(e)
    else if (e.keyCode == 38 && e.shiftKey) # SHIFT + Up arrow
      move_up(e)
    else if (e.keyCode == 40) # Down arrow
      step_down(e)
    else if (e.keyCode == 38) # Up arrow
      step_up(e)
    else if (e.charCode == 32 && e.ctrlKey) # CONTROL + SPACE key
      toggle_step_completed(e)
    else if (e.keyCode == 46 && e.ctrlKey) # CONTROL + SUPR/REMOVE key
      remove_step(e)
    else if (e.charCode == 110 && e.ctrlKey) # CONTROL + "n"
      new_task(e)
    else if (e.charCode == 102 && e.ctrlKey) # CONTROL + "f"
      complete_task(e)
    else if (e.keyCode == 37 && e.ctrlKey) # CONTROL + Left arrow
      level_up(e)
    else if (e.keyCode == 39 && e.ctrlKey) # CONTROL + Right arrow
      level_down(e)
    
      
  # When the user clicks on an input field, make sure it gets selected
  $(".selectable input[type='text']").live 'focus', (el) ->
    $('.selected').removeClass('selected')
    $(this).parents('.selectable').addClass('selected')

jump_task = (e, inverse) ->
  e.preventDefault() # Make sure the default behaviour is not triggered
  $(".selected input[type='text']").trigger('change') # Save the current edited field
  if inverse
    next_tab = $('.navbar li.active').prev('.inactive')
    next_tab = $('.inactive').last() unless next_tab.length    
  else
    next_tab = $('.navbar li.active').next('.inactive')
    next_tab = $('.inactive').first() unless next_tab.length
  if next_tab.length
    # This code was copied from hobo-jquery a handling
    that = next_tab.find('a')
    options = that.data('rapid').a.ajax_attrs
    if (!options.message)
      options.message="Loading..."
    hobo_options = {type: 'GET', attrs: options}
    roptions = that.hjq('buildRequestData', hobo_options)
    that.hjq("changeLocationAjax", that.attr('href'), roptions, hobo_options)


step_down = (e) ->
  e.preventDefault() # Make sure the default behaviour is not triggered
  next_step = $('.selected').next('.selectable')
  next_step = $('.task-list li').first() unless next_step.length
  if next_step.length
    next_step.find("input[type='text']").focus()

step_up = (e) ->
  e.preventDefault() # Make sure the default behaviour is not triggered
  previous_step = $('.selected').prev('.selectable')  #.not('.new-step')
  previous_step = $('#task-editor') unless previous_step.length
  if previous_step.length
    previous_step.find("input[type='text']").focus()
    
toggle_step_completed = (e) ->
  e.preventDefault() # Make sure the default behaviour is not triggered
  step = $('.task-list li.selected')
  checkbox = step.find("input[type='checkbox']")
  input = step.find("input[type='text']")
  if checkbox.attr('checked')
    #completed_step_number = $('.bar').data().completedStepNumber - 1
    input.removeClass('checked')
  else
    #completed_step_number = $('.bar').data().completedStepNumber + 1
    input.addClass('checked')
  checkbox.click()
  #step_number = $('.bar').data().stepNumber
  #percentage = completed_step_number * 100 / step_number
  #$('.bar').width("#{percentage}%")

remove_step = (e) ->
  e.preventDefault() # Make sure the default behaviour is not triggered
  step = $('.task-list li.selected').not('.new-step')
  if step
    next_step = step.next()
    step.find('.delete-link').click()
    next_step.find("input[type='text']").focus()

new_task = (e) ->
  $(".selected input[type='text']").trigger('change')
  e.preventDefault()
  $('#new-link').click()

complete_task = (e) ->
  $(".selected input[type='text']").trigger('change')
  e.preventDefault()
  $('#complete-link').click()
  
level_down = (e) ->
  step = $('.task-list li.selected').not('.new-step')
  if step
    step.find('.level-down-link').click()

level_up = (e) ->
  step = $('.level-up-link').last()
  if step
    step.click()

move_up = (e) ->
  step = $('.task-list li.selected').not('.new-step')
  if step
    step.find('.order-up-link').click()

move_down = (e) ->
  step = $('.task-list li.selected').not('.new-step')
  if step
    step.find('.order-down-link').click()
