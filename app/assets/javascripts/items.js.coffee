# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	checkTextChange = (e) ->
		old = v = $(e).find('#item-text').val()
		return ->
			v = $(e).find('#item-text').val()
			if old isnt v
				old = v
				# parsing markdown to html
				$('#item-preview-content').html(marked(v))
				# highlighting
				$('#item-preview-content').find('pre code').each (i, block) ->
					hljs.highlightBlock(block);

	$(document).on 'keyup', '#item-text', checkTextChange(this)

$(document).ready(ready)
$(document).on('page:load', ready)