// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
/* Ajax Functions */
function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback = data;
        data = {};
    }
    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
        });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});

jQuery.fn.submitWithAjax = function() {
  this.unbind('submit', false);
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })

  return this;
};

//Send data via get if JS enabled
jQuery.fn.getWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.get($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

//Send data via Post if JS enabled
jQuery.fn.postWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.post($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};


jQuery.fn.putWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.put($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};



jQuery.fn.deleteWithAjax = function() {
  this.removeAttr('onclick');
  this.unbind('click', false);
  this.click(function() {
    $.delete_($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};


//This will "ajaxify" the links
function ajaxLinks(){
    $('.ajaxForm').submitWithAjax();
    $('a.get').getWithAjax();
    $('a.post').postWithAjax();
    $('a.put').putWithAjax();
    $('.delete').deleteWithAjax();
}

$(document).ready(function() {

// All non-GET requests will add the authenticity token
  // if not already present in the data packet
 $(document).ajaxSend(function(event, request, settings) {
       if (typeof(window.AUTH_TOKEN) == "undefined") return;
       // IE6 fix for http://dev.jquery.com/ticket/3155
       if (settings.type == 'GET' || settings.type == 'get') return;

       settings.data = settings.data || "";
       settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(window.AUTH_TOKEN);
     });

  ajaxLinks();
});



/* Title Move */
$(window).load(function(){
  $(".title").animate({"left": "+=270px"}, "slow");
});

/* Flash Message Fade */
$(window).load(function () {
  $(".notice").delay(2000).fadeOut("slow");
  });

/* Accordion */
$(function() {
		$( "#accordion" ).accordion({
			event: "mouseover"
		});
	});

	$("input:text").each(function ()
	{
	    // store default value
	    var v = this.value;

	    $(this).blur(function ()
	    {
	        // if input is empty, reset value to default 
	        if (this.value.length == 0) this.value = v;
	    }).focus(function ()
	    {
	        // when input is focused, clear its contents
	        this.value = "";
	    }); 
	});

/*Opacity Slider */
$(document).ready(function() {
     //Step 1: set up the slider with some options. The valid values for opacity are 0 to 1
     //Step 2: Bind an event so when you slide the slider and stop, the following function gets called
     $('#slider').slider({ 
     min: 0, 
     max: 1, 
     step: 0.01, 
     value: .85,
     orientation: "horizontal",
          slide: function(e,ui){
                  $('.shadow').css('opacity', ui.value)

          }                
     })
 });

/* Superfish */
$(document).ready(function(){ 
    $("ul.sf-menu, ul#oe_menu, ul#oe_menu1, ul#oe_menu2, ul#oe_menu3, ul#oe_menu4, ul#oe_menu5").superfish(); 
}); 

/* Expand Box */
$(document).ready(function() {
		$( "#button1" ).toggle(			
	        function() {
				$( ".1" ).animate({ backgroundColor: "#fff", width: "65%", height: 510, opacity: .9, overflow:"scroll" }, 1000 ); },
			function() {
				$( ".1" ).animate({ backgroundColor: "#fff", width: "65%", height: 250, opacity: .8 }, 1000 ); });                        
        $( "#button2" ).toggle(
			function() {
				$( ".2" ).animate({ backgroundColor: "#09f", width: "65%", height: 810, opacity: .9, overflow:"scroll" }, 1000 ); },
		 	function() {
	        	$( ".2" ).animate({ backgroundColor: "#fff", width: "32%", height: 250, opacity: .8 }, 1000 ); });
		$( "#button3" ).toggle(			
	        function() {
				$( ".3" ).animate({ backgroundColor: "#fff", width: "65%", height: 510, opacity: .9, overflow:"scroll" }, 1000 ); },
			function() {
				$( ".3" ).animate({ backgroundColor: "#fff", width: "32%", height: 250, opacity: .8 }, 1000 ); });			
        $( "#button4" ).toggle(
			function() {
				$( ".4" ).animate({ backgroundColor: "#09f", width: "65%", height: 510, opacity: .9, overflow:"scroll" }, 1000 ); },
		 	function() {
	        	$( ".4" ).animate({ backgroundColor: "#fff", width: "32%", height: 250, opacity: .8 }, 1000 ); });
		$( "#button5" ).toggle(			
	        function() {
				$( ".5" ).animate({ backgroundColor: "#fff", width: "65%", height: 510, opacity: .9, overflow:"scroll" }, 1000 ); },
			function() {
				$( ".5" ).animate({ backgroundColor: "#fff", width: "32%", height: 250, opacity: .8 }, 1000 ); });
        $( "#button6" ).toggle(
			function() {
				$( ".6" ).animate({ backgroundColor: "#09f", width: "32%", height: 510, opacity: .9, overflow:"scroll" }, 1000 ); },
		 	function() {
	        	$( ".6" ).animate({ backgroundColor: "#fff", width: "32%", height: 250, opacity: .8 }, 1000 ); });
	});

/* Expand and Collaps Boxes */
$(document).ready(function() {
     // Hide the "view" div.
     $('div#collapse').hide();
     // Watch for clicks on the "slide" link.
     $('div#expand').click(function() {
        // When clicked, toggle the "view" div.
        $(this).next('#collapse').slideToggle(400);
        return false;
     });
  });

/* Info Ticker */
$(function(){
	$('#ticker').list_ticker({
				speed:5000,
                effect:'fade'
	})		
})

$(document).ready(function(){
  $(".movie").mb_YTPlayer();

});



/* Drag and Drop Functions */
$(function() {
		$( "#draggable" ).draggable({ revert: "valid" });
		$( "a#draggable2" ).draggable({ revert: "invalid" });

		$( "#droppable" ).droppable({
			activeClass: "ui-state-hover",
			hoverClass: "ui-state-active",
			drop: function( event, ui ) {
				$( this )
					.addClass( "ui-state-highlight" )
					.find( "p" )
						.html( "Enjoy!" );
			}
		});
	});

/* Modal Window */
	$(document).ready(function(){
	    //get the height and width of the page
	    var window_width = $(window).width();
	    var window_height = $(window).height();
	    //vertical and horizontal centering of modal window(s)
	    /*we will use each function so if we have more then 1
	    modal window we center them all*/
	    $('.modal_window').each(function(){
	        //get the height and width of the modal
	        var modal_height = $(this).outerHeight();
	        var modal_width = $(this).outerWidth();
	        //calculate top and left offset needed for centering
	        var top = (window_height-modal_height)/2;
	        var left = (window_width-modal_width)/2;
	        //apply new top and left css values
	        $(this).css({'top' : top , 'left' : left});
	    });
	        $('.activate_modal').click(function(){
	              //get the id of the modal window stored in the name of the activating element
	              var modal_id = $(this).attr('name');
	              //use the function to show it
	              show_modal(modal_id);
	        });
	        $('.close_modal').click(function(){
	            //use the function to close it
	            close_modal();
	        });
	    });
	    //THE FUNCTIONS\
	    function close_modal(){
	        //hide the mask
	        $('#mask').fadeOut(500);
	        //hide modal window(s)
	        $('.modal_window').fadeOut(500);
	    }
	    function show_modal(modal_id){
	        //set display to block and opacity to 0 so we can use fadeTo
	        $('#mask').css({ 'display' : 'block', opacity : 0});
	        //fade in the mask to opacity 0.8
	        $('#mask').fadeTo(500,0.8);
	         //show the modal window
	        $('#'+modal_id).fadeIn(500);
	    }