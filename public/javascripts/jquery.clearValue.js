/**
 * This function will be applied to all specified objects to
 * clear the value attribute when it's in focus and then restore
 * the value when it's out of focus.
 *
 * @param string focus_color The font colour used when the object is in focus
 * @param string blur_color The font colour used when the object has left focus
 */
jQuery.fn.clearValue = function(options) {
	// Set optional parameters
	var settings = jQuery.extend({
		focus_color: '#393733', blur_color: '#8d8d8d'
	}, options);
	
	// Apply the function to all objects
	return this.each(function() {
		// Only clear fields with a default value
		if($(this).attr('defaultValue') != '') {
			// Make sure the field value stays in focus when the page is refreshed
			if($(this).attr('value') != $(this).attr('defaultValue'))
				$(this).css('color',settings.focus_color);
			
			// Apply an onfocus event to the current object
			$(this).focus(function() {
				// Clear field if value is the default value
				if($(this).attr('value') == $(this).attr('defaultValue')) {
					// Clear the field
					$(this).attr('value','');
					
					// Set the font colour of the field
					$(this).css('color',settings.focus_color);
				}
			});
			
			// Apply an onblur event to the current object
			$(this).blur(function() {
				// Restore field if value is empty
				if($(this).attr('value') == '') {
					// Restore the field
					$(this).attr('value',$(this).attr('defaultValue'));
					
					// Set the font colour of the field
					$(this).css('color',settings.blur_color);
				}
			});
		}
	});
}