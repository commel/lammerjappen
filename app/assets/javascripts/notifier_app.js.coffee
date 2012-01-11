jQuery ->
  txt = $('.flash .warning').text()
  Notifier.warning(txt) if (txt? and txt.trim() != '')

  txt = $('.flash .error').text()
  Notifier.error(txt) if (txt? and txt.trim() != '')
  
  txt = $('.flash .notice').text()
  Notifier.info(txt) if (txt? and txt.trim() != '')

