# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#container').isotope
    layoutMode: 'cellsByRow',
    cellsByRow:
      columnWidth: 240,
      rowHeight: 360
    sortBy: 'filename'
    sortAscending: true
    getSortData:
      filename: ($elem) ->
        $elem.find('.filename').text()
      user: ($elem) ->
        $elem.find('.user').text()
      time: ($elem) ->
        $elem.find('time.updated_at').text()
      available: ($elem) ->
        $elem.find('.available').text()

  $('#sort-by a').click ->
    sortName = $(this).attr('href').slice(1)
    $('#container').isotope
      sortBy: sortName
    return false

  $('#sort-direction a').click ->
    sortDirectionStr = $(this).attr('href').slice(1)
    if sortDirectionStr is 'asc'
      sortAscending = true
    else
      sortAscending = false
    $('#container').isotope
      sortAscending: sortAscending
    return false

  $('button#new').click ->
    $('#upform').toggle()

  $('.actionctrl-lnk').click ->
    document_id = $(this).attr('id').match(/\d+/)
    $('#docactions-' + document_id).toggle('slow')

  $('.toggle-update-form').click ->
    document_id = $(this).attr('id').match(/\d+/)
    $('#updateform-' + document_id).toggle('slow')