(function($) {

  //the plugin
  $.fn.timePicker = function(options) {
    return this.each(function() {
      var element = $(this);
      // Return early if this element already has a plugin instance
      if (element.data('timePicker')) return;
      // pass options to plugin constructor _init
      console.log('making an instance');
      var btnInstance = new timePicker(this, options);
      // Store plugin object in this element's data
      element.data('timePicker', btnInstance);
    });
  };

  var timePicker = function(ele, options) {

    //vairables 
    var tp_div;
    var tp_input;
    var time = {
      hours: '00',
      minutes: '00',
      seconds: '00'
    };
    var errors = {};
    var tmp = {};
    var time_str;

    var settings = $.extend({
      // These are the defaults.
      basetime: 0,
      debug: 1
    }, options);

    console.log($(ele).attr('id'));

    //initialize the button
    _init(ele);

    //block variables

    this.abc = function() {
      
    }

    //show time picker div
    this.showTP = function() {
      tp_div.show().focus();
      tp_input.prop('readonly',true);
      tp_div.blur(this.hideTP);
      _dump('showTP');
    }

    //hide time picker div
    this.hideTP = function() {
      _dump('hideTP', tmp.dont_blur);
      if ( tmp.dont_blur ) {
        tmp.dont_blur = false;
        //tp_div.focus();
      }
      else {
        tp_div.hide();  
      }      
      
    }

    this.getTime = function() {
      _fetchTime();
      _validateTime();
      //check and handle errors
      _buildTime();
      return time_str;
    }

    /* ---- private functions ---- */

    function _init(ele) {
      tp_input = $(ele);

      //append picker div and icon
      tp_input.after(time_bg);
      tp_input.after(clock_ico);

      tp_div = tp_input.nextAll('.time-bg');
               
      //should the defautls get populated here      
      _dump('init',tp_div);
      
      tp_div.find('.time-form input').mousedown(function (event) {
          mouseDownID = $(this).attr('name');
          console.log('mousedown fired on ' + mouseDownID);
          //event.stopPropagation(); 
          tmp.dont_blur = true;
      });
          

    }
    
    //function _setBlur()

    //fetch time from inputs in to a hash 
    function _fetchTime() {
      tp_div.find('.time-form input').each(function() {
        time[$(this).attr('name')] = $(this).val();
      });
      _dump('_fetchTime', time);
    }

    //validate time  
    function _validateTime() {
      //valid integer check
      jQuery.each(obj, function(field, val) {
        //SO - krisk
        errors[field] = isNaN(value) ||
          parseInt(Number(value)) != value ||
          isNaN(parseInt(value, 10));

        if (errors[field]) {
          return true;
        }

        //hours     
        if (field == 'hours' && (time.hours < 0 || time.hours > 24)) {
          errors[field] = true;
        }

        //minutes
        if (field == 'minutes' && (time.minutes < 0 || time.hours > 59)) {
          errors[field] = true;
        }

        //seconds
        if (field == 'seconds' && (time.minutes < 0 || time.hours > 59)) {
          errors[field] = true;
        }

      });
      _dump('_validateTime', errors);
    }

    //build time string  
    //#TODO: append '0' ?
    function _buildTime() {
      time_str = '' + time.hours + ':' + time.minutes + ':' + time.seconds;
      _dump('_buildTime', time_str);
    }

    //logging 
    function _dump(x, y) {
      if (settings.debug) {
        console.log(x, y);
      }
    }

  };

  var clock_ico = '<span class="time-clock"> &#128336; </span>';
  var time_bg = '<div tabindex="-1" class="time-bg" style="display:none"><div class="time-title">Pick a time</div><div class="time-form"><input type="number" min="00" max="24" name="hours" size="2" maxlength="2" placeholder="hh"> :  <input type="number" min="00" max="59" name="minutes" size="2" maxlength="2" placeholder="mm"> : <input type="number" min="00" max="59" name="seconds" size="2" maxlength="2" placeholder="ss"> </div>   <div name="ok_btn" class="tp-btn tp-btn--ok">&#10004;</div>  <div name="ok_btn" class="tp-btn tp-btn--cancel">&#10006;</div> </div>';

}(jQuery));


$('.time-picker').timePicker();

$('.time-picker').click( function() {
  var ele = $(this);
  var tp = ele.data('timePicker');
  console.log('got timePicker',tp);
  tp.showTP();
});