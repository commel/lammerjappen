# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#container').isotope
    layoutMode: 'cellsByRow',
    cellsByRow:
      columnWidth: 240,
      rowHeight: 150 
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
    $('#upform').dialog
      height: 175,
      width: 400,
      modal: true,
      title: "Neue Datei hochladen"

  $('.actionctrl-lnk').click ->
    document_id = $(this).attr('id').match(/\d+/)
    filename = $("#document-" + document_id).find("div.filename").text()
    $('#docactions-' + document_id).dialog
      height: 150,
      width: 300,
      modal: true,
      title: "Dokument " + filename,
      close: (event, ui) ->
        location.reload(true)

  $('.toggle-update-form').click ->
    document_id = $(this).attr('id').match(/\d+/)
    filename = $("#document-" + document_id).find("div.filename").text()
    $('#updateform-' + document_id).dialog
      height: 175,
      width: 400,
      modal: true,
      title: "Dokument " + filename + " erneut hochladen"
