using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Math as Math;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.ActivityMonitor as Act;

var returnVal = -1;
var lView;

class CD extends Ui.ConfirmationDelegate {
    function onResponse(value) {
        if( value == 0 ) {
            returnVal = 1;
        }
        else {
            returnVal = 0;
        }
        saveResponce(  );
    }
    
    function saveResponce( ) {
    	App.getApp().setProperty("24hrMode", returnVal);
    }
}

class SliderWatchFaceView extends Ui.WatchFace {  

    var cd;
    
	function setProp( hrMode, view )
	{
		returnVal = hrMode;
		lView = view;
		cd = new Ui.Confirmation( "24 hr mode?" );
        Ui.pushView( cd, new CD(), Ui.SLIDE_IMMEDIATE );
	}
    
    //! Load your resources here
    function onLayout(dc) {    	
        //setLayout(Rez.Layouts.WatchFace(dc));
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    	
    }

    //! Update the view
    function onUpdate(dc) {
    if(returnVal>=0) { 
    		var hrOffset = returnVal;   		
	      	var w = dc.getWidth();
	    	var h = dc.getHeight();
	    	var last_hour;
	    	var next_hour;
	    	var clock_offset = 0.0;
	    	var date_offset = 0.0;
	    	var step_offset = 0.0;
	    	dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
	        dc.clear();
	        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
	        
	        // Get and show the current time        
	        var clockTime = Sys.getClockTime();
	        var hour = Sys.getClockTime().hour;
	        var min = Sys.getClockTime().min;
	        //var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%.2d")]);
	        var info_Y = Calendar.info(Time.now().add(new Time.Duration(-86400)), Time.FORMAT_LONG);
	        var info = Calendar.info(Time.now(), Time.FORMAT_LONG);
	        var info_T = Calendar.info(Time.now().add(new Time.Duration(86400)), Time.FORMAT_LONG);
	        
	        //
	        //Battery Bar
			//
	
			//TBD
			
			//
			// Date
			//
			var y_data_start = 15;
			
			var clock_line_date_y1 = y_data_start;
			var clock_line_date_y2 = y_data_start+25;
			
			var x_clock = w/2;
			
			if(hour==0 && date_offset != 0) {
				dat_offset = 0;
			}
			date_offset = hour * 4.166667;
			x_clock-=date_offset;
			var month = Lang.format("$1$", [info.day_of_week]);
			dc.drawText(x_clock+50, clock_line_date_y1-15, Gfx.FONT_MEDIUM , month, Gfx.TEXT_JUSTIFY_CENTER );
			var day = Lang.format("$1$", [info.day]);
			dc.drawText(x_clock+50, clock_line_date_y1+10, Gfx.FONT_SMALL , day, Gfx.TEXT_JUSTIFY_CENTER );
			
			dc.drawLine(x_clock, clock_line_date_y1, x_clock, clock_line_date_y2);
			dc.drawLine(x_clock+1, clock_line_date_y1, x_clock+1, clock_line_date_y2);
			x_clock += 100;
			dc.drawLine(x_clock, clock_line_date_y1, x_clock, clock_line_date_y2);
			dc.drawLine(x_clock+1, clock_line_date_y1, x_clock+1, clock_line_date_y2);
			x_clock += 100;
			dc.drawLine(x_clock, clock_line_date_y1, x_clock, clock_line_date_y2);
			dc.drawLine(x_clock+1, clock_line_date_y1, x_clock+1, clock_line_date_y2);
			
			month = Lang.format("$1$", [info_T.day_of_week]);
			dc.drawText(x_clock-50, clock_line_date_y1-15, Gfx.FONT_MEDIUM , month, Gfx.TEXT_JUSTIFY_CENTER );
			day = Lang.format("$1$", [info_T.day]);
			dc.drawText(x_clock-50, clock_line_date_y1+10, Gfx.FONT_SMALL , day, Gfx.TEXT_JUSTIFY_CENTER );
			
			x_clock = (w/2)-100;	
			x_clock-=date_offset;
			dc.drawLine(x_clock, clock_line_date_y1, x_clock, clock_line_date_y2);
			dc.drawLine(x_clock+1, clock_line_date_y1, x_clock+1, clock_line_date_y2);
			
			month = Lang.format("$1$", [info_Y.day_of_week]);
			dc.drawText(x_clock+50, clock_line_date_y1-15, Gfx.FONT_MEDIUM , month, Gfx.TEXT_JUSTIFY_CENTER );
			day = Lang.format("$1$", [info_Y.day]);
			dc.drawText(x_clock+50, clock_line_date_y1+10, Gfx.FONT_SMALL , day, Gfx.TEXT_JUSTIFY_CENTER );
			
			var l = w/2 - date_offset;
			var k = l;
			var j = w - date_offset;
			for(var i = 0; i < 10; i++)
			{
				l+=9;
				k-=9;
				j+=9;
				dc.drawPoint( l, 27);
				dc.drawPoint( k, 27);
				dc.drawPoint( j, 27);
			}
			
			
			//
			//Clock	
			//
			if(min == 0 && clock_offset != 0) {
				clock_offset = 0;
			}
			
			var y_start = 80;
			
			var clock_line_min_y1 = y_start+5;
			var clock_line_min_y2 = y_start+15;
			var clock_line_hr_y1  = y_start;
			var clock_line_hr_y2  = y_start+20;
			
			//min = 15;
			
			x_clock = w/2;	
			clock_offset = min * 1.6667;
			x_clock -= clock_offset;
			//Sys.println(clock_offset + " " + min + " " + x_clock);
			
	    	var hour_s;
	    	var hour_s_N;
	    	var hour_s_P;
			if(info.hour<10) {
				hour_s = Lang.format("0$1$", [info.hour]);
			} else if( info.hour<13 && info.hour >= 10 ) {
				hour_s = Lang.format("$1$", [info.hour]);
			} else if(info.hour>=13 && info.hour<22 && hrOffset == 1) {
				hour_s = Lang.format("0$1$", [info.hour-12]);
			} else {
				hour_s = Lang.format("$1$", [info.hour-12*hrOffset]);
			}
			
			var min_s = Lang.format("$1$", [info.min]);
			
			dc.drawText(x_clock, clock_line_hr_y1-38, Gfx.FONT_NUMBER_MEDIUM, hour_s, Gfx.TEXT_JUSTIFY_CENTER);
			
			dc.drawLine(x_clock, clock_line_hr_y1, x_clock, clock_line_hr_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "00", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock += 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "15", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock += 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "30", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock += 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "45", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock += 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			
			//Next Hour
			var next = info.hour+1;
			if(next<10) {
				hour_s_N = Lang.format("0$1$", [next]);
			} else if( next<13 && next>= 10 ) {
				hour_s_N = Lang.format("$1$", [next]);
			} else if(next>=13 && next<22 && hrOffset==1) {
				hour_s_N = Lang.format("0$1$", [next-12*hrOffset]);
			} else {
				hour_s_N = Lang.format("$1$", [next-12*hrOffset]);
			}
			dc.drawLine(x_clock, clock_line_hr_y1, x_clock, clock_line_hr_y2);
			dc.drawText(x_clock, clock_line_hr_y1-38, Gfx.FONT_NUMBER_MEDIUM, hour_s_N, Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "00", Gfx.TEXT_JUSTIFY_CENTER);
			
			x_clock += 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "15", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock += 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "30", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock += 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "45", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock += 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			
			//Next Next Hour
			next = info.hour+2;
			if(next<10) {
				hour_s_N = Lang.format("0$1$", [next]);
			} else if( next<13 && next>= 10 ) {
				hour_s_N = Lang.format("$1$", [next]);
			} else if(next>=13 && next<22 && hrOffset == 1) {
				hour_s_N = Lang.format("0$1$", [next-12]);
			} else {
				hour_s_N = Lang.format("$1$", [next-12*hrOffset]);
			}
			
			dc.drawLine(x_clock, clock_line_hr_y1, x_clock, clock_line_hr_y2);
			dc.drawText(x_clock, clock_line_hr_y1-38, Gfx.FONT_NUMBER_MEDIUM, hour_s_N, Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "00", Gfx.TEXT_JUSTIFY_CENTER);
			
			//Reset position to "middle"
			x_clock = w/2;
			x_clock -= clock_offset;
			
			dc.drawLine(x_clock, clock_line_hr_y1, x_clock, clock_line_hr_y2);
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			x_clock -= 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "45", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock -= 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "30", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock -= 25;
			dc.drawPoint( x_clock - 8, clock_line_hr_y1+10);
			dc.drawPoint( x_clock - 17, clock_line_hr_y1+10);
			dc.drawLine(x_clock, clock_line_min_y1, x_clock, clock_line_min_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "15", Gfx.TEXT_JUSTIFY_CENTER);
			x_clock -= 25;
			
			
			//Prev Hour
			var prev = info.hour-1;
			if(prev<10) {
				hour_s_P = Lang.format("0$1$", [prev]);
			} else if( prev<13 && prev >= 10 ) {
				hour_s_P = Lang.format("$1$", [prev]);
			} else if(prev>=13 && prev<22 && hrOffset == 1) {
				hour_s_P = Lang.format("0$1$", [prev-12]);
			} else {
				hour_s_P = Lang.format("$1$", [prev-12*hrOffset]);
			}
			dc.drawText(x_clock, clock_line_hr_y1-38, Gfx.FONT_NUMBER_MEDIUM, hour_s_P, Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawLine(x_clock, clock_line_hr_y1, x_clock, clock_line_hr_y2);
			dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "00", Gfx.TEXT_JUSTIFY_CENTER);
			
			
			
			
			//
			// Steps
			//
	
			var activity = Act.getInfo();
			var steps = activity.steps;
			var step_goal = activity.stepGoal;
			step_offset = steps*0.1;
			var halfK = 500;
			var fullK = 1000;
			var reset = false;		
			
			if(steps>=1000) {
				//reset count
				step_offset = steps*0.1 - (steps/1000) * 100;
				reset = true;
			}
			
			
			var nearest_half_K = 1;
			var nearest_full_K = 1;
			if(steps%1000 <= 500) {
				nearest_half_K = steps / halfK + 2;
				nearest_full_K = steps / fullK + 1;
			} else {
				nearest_half_K = steps / halfK + 1;
				nearest_full_K = steps / fullK + 1;
			}
			//Sys.println(nearest_half_K + " "+nearest_full_K+" " + steps);		
			y_start = 130;
			var clock_line_step_y1 = y_start+4;
			var clock_line_step_y2 = y_start+12;
			var clock_line_1K_step_y1  = y_start;
			var clock_line_1K_step_y2  = y_start+16;
			x_clock = w/2 - step_offset;
			
			var string_step = "0";
			var temp_offset = 5;
			if(steps >= 10000) {
				temp_offset = 20;	
			} else if(steps >= 1000) {
				temp_offset = 16;
			}
			string_step = Lang.format("$1$", [1000*(nearest_full_K-1)]);
			dc.drawText(x_clock-2, clock_line_1K_step_y1-10, Gfx.FONT_XTINY, string_step, Gfx.TEXT_JUSTIFY_RIGHT);
			dc.drawLine(x_clock, clock_line_1K_step_y1, x_clock, clock_line_1K_step_y2);
			x_clock += 50;
			string_step = Lang.format("$1$", [500*(nearest_half_K-1)]); 
			dc.drawText(x_clock-2, clock_line_1K_step_y1-10, Gfx.FONT_XTINY, string_step, Gfx.TEXT_JUSTIFY_RIGHT);
			dc.drawLine(x_clock, clock_line_step_y1, x_clock, clock_line_step_y2);
			x_clock += 50;
			if(1000*nearest_full_K >= 1000) {
				temp_offset = 16;	
			}
			string_step = Lang.format("$1$", [1000*nearest_full_K]); 
			dc.drawText(x_clock-2, clock_line_1K_step_y1-10, Gfx.FONT_XTINY, string_step, Gfx.TEXT_JUSTIFY_RIGHT);
			dc.drawLine(x_clock, clock_line_1K_step_y1, x_clock, clock_line_1K_step_y2);
			x_clock +=50;
			string_step = Lang.format("$1$", [500*(nearest_half_K+1)]); 
			dc.drawText(x_clock-2, clock_line_1K_step_y1-10, Gfx.FONT_XTINY, string_step, Gfx.TEXT_JUSTIFY_RIGHT);
			dc.drawLine(x_clock, clock_line_step_y1, x_clock, clock_line_step_y2);
			x_clock += 50;
			string_step = Lang.format("$1$", [1000*(nearest_full_K+1)]); 
			dc.drawText(x_clock-2, clock_line_1K_step_y1-10, Gfx.FONT_XTINY, string_step, Gfx.TEXT_JUSTIFY_RIGHT);
			dc.drawLine(x_clock, clock_line_1K_step_y1, x_clock, clock_line_1K_step_y2);
			
			x_clock = w/2 - step_offset;
			var temp = 0;
				for(var i = 0; i < 20; i++) {
					dc.drawPoint( x_clock-temp, clock_line_step_y1+5);
					temp-=10;
					
				}
			if(steps<=1000) {
				//dots
				//x_clock-=step_offset;
				var temp = 10;
				for(var i = 0; i < 15; i++) {
					dc.drawPoint( x_clock-temp, clock_line_step_y1+5);
					temp+=10;
				}
			} else {
				dc.drawLine(x_clock, clock_line_1K_step_y1, x_clock, clock_line_1K_step_y2);
				dc.drawPoint( x_clock-10, clock_line_step_y1+5);
				dc.drawPoint( x_clock-20, clock_line_step_y1+5);
				dc.drawPoint( x_clock-30, clock_line_step_y1+5);
				dc.drawPoint( x_clock-40, clock_line_step_y1+5);
				x_clock -= 50;
				string_step = Lang.format("$1$", [500*(nearest_half_K-3)]); 
				dc.drawText(x_clock-2, clock_line_1K_step_y1-10, Gfx.FONT_XTINY, string_step, Gfx.TEXT_JUSTIFY_RIGHT);
				dc.drawLine(x_clock, clock_line_step_y1, x_clock, clock_line_step_y2);
				dc.drawPoint( x_clock-10, clock_line_step_y1+5);
				dc.drawPoint( x_clock-20, clock_line_step_y1+5);
				dc.drawPoint( x_clock-30, clock_line_step_y1+5);
				dc.drawPoint( x_clock-40, clock_line_step_y1+5);
				x_clock -= 50;
				string_step = Lang.format("$1$", [1000*(nearest_full_K-2)]);
				dc.drawText(x_clock-2, clock_line_1K_step_y1-10, Gfx.FONT_XTINY, string_step, Gfx.TEXT_JUSTIFY_RIGHT);
				dc.drawLine(x_clock, clock_line_1K_step_y1, x_clock, clock_line_1K_step_y2);
				dc.drawPoint( x_clock-10, clock_line_step_y1+5);
				dc.drawPoint( x_clock-20, clock_line_step_y1+5);
				dc.drawPoint( x_clock-30, clock_line_step_y1+5);
				dc.drawPoint( x_clock-40, clock_line_step_y1+5);
			}
			
			//
	        //Step Goal Bar
			//
	
			//TBD
	
	
			//This is the last thing to do
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(w/2 + 1, 0, w/2 + 1, h);
			dc.drawLine(w/2, 0, w/2, h);
			dc.drawLine(w/2 - 1, 0, w/2 - 1, h);
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
		} 
		else {
			
		}
    }

    //! The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    //! Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}