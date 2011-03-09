/*
 * jQuery ExpandCollapse Plugin
 * 
 * @ Version: 0.2
 * 
 * @ Author: Kyle Florence (kyle.florence@gmail.com)
 * @ Update: August 5, 2009
 *
 */

(function($)
{    
    // Attach expand/collapse functionality to specified jQuery object(s)
    $.fn.expandCollapse = function(options)
    {
        // Default settings
        options = $.extend({}, $.fn.expandCollapse.defaults, options);
        
        // Handle expand/collapse clicks
        $.fn.expandCollapse.doClick = function(event)
        {            
            // Get our elements
            text    = event.data.text;
            target  = event.data.target;
            trigger = event.data.trigger;
            options = event.data.options;
            
            // Whether or not the target is hidden
            hidden = (target.is(":hidden") ? true : false);

            // Set updated attributes based on visibility
            tText =
                (hidden ? options.collapseText : options.expandText);
            tAddClass =
                (hidden ? options.collapseClass : options.expandClass);
            tRemoveClass =
                (hidden ? options.expandClass : options.collapseClass);
            tAnimation = 
                (hidden ? options.expandAnimation : options.collapseAnimation);
            tDuration =
                (hidden ? options.expandDuration : options.collapseDuration);
            
            // Animate target
            target.animate(tAnimation, tDuration);

            // Update trigger class if updateClass is on
            if (options.updateClass) {
                trigger.removeClass(tRemoveClass).addClass(tAddClass);
            }
            
            // Update text if updateText is on
            if (options.updateText) {
                text.text(tText);
            }

            // Make sure we don't go anywhere
            return false;
        };

        // Included in the case of multiple jQuery objects
        return this.each(function()
        {
            // Automatically hide content if startHidden is on
            if (options.startHidden) $(this).hide();
            
            // Whether or not this element is hidden
            hidden = ($(this).is(":hidden") ? true : false);
            
            // Set class and text based on visibility
            tText = (hidden ? options.expandText : options.collapseText);
            tClass = (hidden ? options.expandClass : options.collapseClass);
            
            // Trigger element was not passed in, create one
            if (!options.triggerElement.length)
            {
                // Create the trigger element
                triggerElement = $(options.triggerTag).append(
                    $("<a/>").attr({"href" : "#", "title" : tText})
                );
                
                // Assign text if updateText is on
                if (options.updateText) {
                    triggerElement.children().text(tText);
                }
                
                // Assign class if updateClass is on
                if (options.updateClass) {
                    triggerElement.addClass(tClass);
                }
                
                // Bind our click event
                triggerElement.bind(
                    'click', {
                        options : options,
                        trigger : triggerElement,
                        text    : triggerElement.children(),
                        target  : $(this)
                    }, function(event) { return $.fn.expandCollapse.doClick(event); }
                );
                    
                // Append our element to the DOM
                $(this).after(triggerElement);
            }
            
            // An element has been passed in
            else
            {
                // Assign textElement to triggerElement if not set
                textElement =
                    ((options.textElement.length) ? 
                        options.textElement : options.triggerElement);
                
                // Assign text if updateText is on
                if (options.updateText) {
                    textElement.text(tText);
                }
                
                // Assign class if updateClass is on
                if (options.updateClass) {
                    options.triggerElement.addClass(tClass);
                }
                
                // Bind our click event
                options.triggerElement.bind(
                    'click', {
                        options : options,
                        trigger : options.triggerElement,
                        text    : textElement,
                        target  : $(this)
                    }, function(event) { return $.fn.expandCollapse.doClick(event); }
                );
            }
        });
    };
    
    // Default settings
    $.fn.expandCollapse.defaults =
    {
        /*                  Boolean Ooptions                                    */
        updateText          : true,
        updateClass         : true,
        startHidden         : false,
            
        /*                  Trigger Options                                     */
        triggerTag          : "<span/>",
        triggerElement      : "",
        expandClass         : "expand",
        collapseClass       : "collapse",
        
        /*                  Text Options                                        */
        textElement         : "",
        expandText          : "more",
        collapseText        : "less",
        
        /*                  Animation Options                                   */
        expandAnimation     : {height : "show"},
        collapseAnimation   : {height : "hide"},
        expandDuration      : 0,
        collapseDuration    : 0
    };
})(jQuery);