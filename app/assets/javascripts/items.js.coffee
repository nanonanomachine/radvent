# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@parseText = (text) ->
		# parsing markdown to html
		$('#item-preview-content').html(marked(text))
		# highlighting
		$('#item-preview-content').find('pre code').each (i, block) ->
			hljs.highlightBlock(block);

@checkTextChange = () ->
	old = v = $('#item-text').val()
	return ->
		v = $('#item-text').val()
		if old isnt v
			old = v
			parseText(v)

@attachmentImageInputChange = (e) ->
	e.preventDefault
	return if !this.files.length
	form_data = new FormData
	form_data.append $(this).attr('name'), $(this).prop('files')[0]
	form_data.append $('#attachment-advent-calendar-id').attr('name'), 
		$('#attachment-advent-calendar-id').val()
	$.ajax '/attachments',
		type: 'POST',
		dataType: 'json',
		data: form_data,
		processData: false,
		contentType: false,
		success: (data) ->
			$(this).val('');
			$('#item-text').val $('#item-text').val() + 
				"\r\n![#{data.image_name}](#{data.image_url})"
			parseText $('#item-text').val()

ready = ->
	parseBody = ->
		$('#item-show').html(marked(text))
		$('#item-show').find('pre code').each (i, block) ->
			hljs.highlightBlock(block);
	parseBody() if $('#item-show')[0]
	parseText $('#item-text').val() if $('#item-text').val()
	
$(document).ready ready
$(document).on 'page:load', ready
$(document).on 'keyup', '#item-text', checkTextChange()
$(document).on 'change', '#attachment-image-select', attachmentImageInputChange