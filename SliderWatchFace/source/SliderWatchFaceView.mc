using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Math as Math;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.ActivityMonitor as Act;

class SliderWatchFaceView extends Ui.WatchFace {  
    
    //! Load your resources here
    function onLayout(dc) {
        //setLayout(Rez.Layouts.WatchFace(dc));
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
    	var hrMode = Sys.getDeviceSettings().is24Hour;
    	var w = dc.getWidth();
    	var h = dc.getHeight();
    	var last_hour;
    	var next_hour;
    	var clock_offset = 0.0;
    	var date_offset = 0.0;
    	var step_offset = 0.0;
    	
    	var bakColor = Application.getApp().getProperty("backgroundColor");
    	
    	if( bakColor == 0 ) {
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_WHITE );	
		}
		else if( bakColor == 1 ) {
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_LT_GRAY );
		}
		else if( bakColor == 2 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_DK_GRAY );
		}
		else if( bakColor == 3 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
		}
		else if( bakColor == 4 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
		}
		else if( bakColor == 5 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_RED );
		}
		else if( bakColor == 6 ) {
			dc.setColor( Gfx.COLOR_TRANSPARENT, 0xFF6600 );
		}
		else if( bakColor == 7 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_YELLOW );			
		}
		else if( bakColor == 8 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_GREEN );			
		}
		else if( bakColor == 9 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_DK_GREEN );			
		}
		else if( bakColor == 10 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLUE );		
		}
		else if( bakColor == 11 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_DK_BLUE );			
		}
		else if( bakColor == 12 ){
			//Do something different if Purple. Not valid on Fenix 3 or D2 Bravo. Use 0x5500AA instead.
			dc.setColor( Gfx.COLOR_TRANSPARENT, 0x5500AA );
		}
		else if( bakColor == 13 ){
			dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_PINK );		
		}
    	
    	//dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
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
        
        var numColor = Application.getApp().getProperty("numberColor");
        var barColor = Application.getApp().getProperty("barColor");
        var stepBarOptions = Application.getApp().getProperty("stepBarOptions");
        
        //
        //Battery Bar
		//

		var bat = Sys.getSystemStats().battery;
		dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);
		
		var bat_x_shift = 102-bat*1.02;		
		
		var batteryThick = Application.getApp().getProperty("batteryThickness");
		
		if(batteryThick==0) {
				
		}
		else if(batteryThick==1) {
			dc.drawLine(102-bat_x_shift, 0, w-bat_x_shift, 0);
			dc.setColor( Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(175-bat_x_shift, 0, w-bat_x_shift, 0);
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(195-bat_x_shift, 0, w, 0);	
		}
		else if(batteryThick==2) {
			dc.drawLine(102-bat_x_shift, 0, w-bat_x_shift, 0);
			dc.setColor( Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(175-bat_x_shift, 0, w-bat_x_shift, 0);
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(195-bat_x_shift, 0, w, 0);
			dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(102-bat_x_shift, 1, w-bat_x_shift, 1);
			dc.setColor( Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(175-bat_x_shift, 1, w-bat_x_shift, 1);
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(195-bat_x_shift, 1, w, 1);	
		}
		else if(batteryThick==3) {
			dc.drawLine(102-bat_x_shift, 0, w-bat_x_shift, 0);
			dc.setColor( Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(175-bat_x_shift, 0, w-bat_x_shift, 0);
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(195-bat_x_shift, 0, w, 0);
			dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(102-bat_x_shift, 1, w-bat_x_shift, 1);
			dc.setColor( Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(175-bat_x_shift, 1, w-bat_x_shift, 1);
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(195-bat_x_shift, 1, w, 1);
			dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(102-bat_x_shift, 2, w-bat_x_shift, 2);
			dc.setColor( Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(175-bat_x_shift, 2, w-bat_x_shift, 2);
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
			dc.drawLine(195-bat_x_shift, 2, w, 2);
				
		}

		if( numColor == 0 ) {
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);	
		}
		else if( numColor == 1 ) {
			dc.setColor( Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
		}
		else if( numColor == 2 ){
			dc.setColor( Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
		}
		else if( numColor == 3 ){
			dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
		}
		else if( numColor == 4 ){
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
		}
		else if( numColor == 5 ){
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
		}
		else if( numColor == 6 ) {
			dc.setColor( 0xFF6600, Gfx.COLOR_TRANSPARENT);			
		}
		else if( numColor == 7 ){
			dc.setColor( Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);			
		}
		else if( numColor == 8 ){
			dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);			
		}
		else if( numColor == 9 ){
			dc.setColor( Gfx.COLOR_DK_GREEN, Gfx.COLOR_TRANSPARENT);			
		}
		else if( numColor == 10 ){
			dc.setColor( Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);			
		}
		else if( numColor == 11 ){
			dc.setColor( Gfx.COLOR_DK_BLUE, Gfx.COLOR_TRANSPARENT);			
		}
		else if( numColor == 12 ){
			//Do something different if Purple. Not valid on Fenix 3 or D2 Bravo. Use 0x5500AA instead.
			dc.setColor( 0x5500AA, Gfx.COLOR_TRANSPARENT);			
		}
		else if( numColor == 13 ){
			dc.setColor( Gfx.COLOR_PINK, Gfx.COLOR_TRANSPARENT);			
		}
		
		
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
		var hour_drop = 38;
		
		if( stepBarOptions==0 ) {
			y_start += 15;
			hour_drop = 45;			
		}		
		
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
		} else if(info.hour>=13 && info.hour<22 && !hrMode) {
			hour_s = Lang.format("0$1$", [info.hour-12]);
		} else {
			if(hrMode) {
				hour_s = Lang.format("$1$", [info.hour]);
			}
			else {
				hour_s = Lang.format("$1$", [info.hour-12]);
			}
		}
		
		var min_s = Lang.format("$1$", [info.min]);
		if(stepBarOptions == 0) {
			dc.drawText(x_clock, clock_line_hr_y1-hour_drop, Gfx.FONT_NUMBER_HOT, hour_s, Gfx.TEXT_JUSTIFY_CENTER);
		} else {
			dc.drawText(x_clock, clock_line_hr_y1-hour_drop, Gfx.FONT_NUMBER_MEDIUM, hour_s, Gfx.TEXT_JUSTIFY_CENTER);
		}
		
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
		if(next == 24) {
			if(hrMode) {
				next = 0;
			} else {
				next = 12;
			}
		}
		if(next<10) {
			hour_s_N = Lang.format("0$1$", [next]);
		} else if( next<13 && next>= 10 ) {
			hour_s_N = Lang.format("$1$", [next]);
		} else if(next>=13 && next<22 && !hrMode) {
			hour_s_N = Lang.format("0$1$", [next-12]);
		} else {
			if(hrMode) {
				hour_s_N = Lang.format("$1$", [next]);
			} else {
				hour_s_N = Lang.format("$1$", [next-12]);
			}
		}
		dc.drawLine(x_clock, clock_line_hr_y1, x_clock, clock_line_hr_y2);
		
		if(stepBarOptions == 0) {
			dc.drawText(x_clock, clock_line_hr_y1-hour_drop, Gfx.FONT_NUMBER_HOT, hour_s_N, Gfx.TEXT_JUSTIFY_CENTER);
		} else {
			dc.drawText(x_clock, clock_line_hr_y1-hour_drop, Gfx.FONT_NUMBER_MEDIUM, hour_s_N, Gfx.TEXT_JUSTIFY_CENTER);
		}		
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
		if(next == 24) {
			next = 0;
		}
		if(next == 25) {
			next = 1;
		}
		if(next<10) {
			hour_s_N = Lang.format("0$1$", [next]);
		} else if( next<13 && next>= 10 ) {
			hour_s_N = Lang.format("$1$", [next]);
		} else if(next>=13 && next<22 && !hrMode) {
			hour_s_N = Lang.format("0$1$", [next-12]);
		} else {
			if(hrMode) {
				hour_s_N = Lang.format("$1$", [next]);
			} else {
				hour_s_N = Lang.format("$1$", [next-12]);
			}
		}
		
		dc.drawLine(x_clock, clock_line_hr_y1, x_clock, clock_line_hr_y2);
		if(stepBarOptions == 0) {
			dc.drawText(x_clock, clock_line_hr_y1-hour_drop, Gfx.FONT_NUMBER_HOT, hour_s_N, Gfx.TEXT_JUSTIFY_CENTER);
		} else {
			dc.drawText(x_clock, clock_line_hr_y1-hour_drop, Gfx.FONT_NUMBER_MEDIUM, hour_s_N, Gfx.TEXT_JUSTIFY_CENTER);
		}		
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
		if(prev==-1) {
			prev = 23;
		}
		if(prev<10) {
			hour_s_P = Lang.format("0$1$", [prev]);
		} else if( prev<13 && prev >= 10 ) {
			hour_s_P = Lang.format("$1$", [prev]);
		} else if(prev>=13 && prev<22 && !hrMode) {
			hour_s_P = Lang.format("0$1$", [prev-12]);
		} else {
			if(hrMode) {
				hour_s_P = Lang.format("$1$", [prev]);
			} else {
				hour_s_P = Lang.format("$1$", [prev-12]);
			}
		}
		
		if(stepBarOptions == 0) {
			dc.drawText(x_clock, clock_line_hr_y1-hour_drop, Gfx.FONT_NUMBER_HOT, hour_s_P, Gfx.TEXT_JUSTIFY_CENTER);
		} else {
			dc.drawText(x_clock, clock_line_hr_y1-hour_drop, Gfx.FONT_NUMBER_MEDIUM, hour_s_P, Gfx.TEXT_JUSTIFY_CENTER);
		}		
		dc.drawLine(x_clock, clock_line_hr_y1, x_clock, clock_line_hr_y2);
		dc.drawText(x_clock, clock_line_hr_y2-2, Gfx.FONT_TINY, "00", Gfx.TEXT_JUSTIFY_CENTER);
		
		
		//
		// Steps
		//

		var activity = Act.getInfo();
		var steps = activity.steps;
        var cal = activity.calories;
		var step_goal = activity.stepGoal;


	if( stepBarOptions!=0 ) {
		
			if(stepBarOptions==1) {
				steps = steps;
			} else if(stepBarOptions==2) {
				steps = cal;
			}

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
			
			//Mag
			//if(magGlass) {		
			//	var mag_start = w/2 - 40;
			//	var mag_end   = w/2 + 40;
			//	dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLUE);
			//	dc.fillRectangle(mag_start, clock_line_hr_y1+2, mag_end-mag_start,  clock_line_hr_y2 - clock_line_hr_y1 - 4);
				
			//	dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
				
				//dc.drawLine(mag_start, clock_line_hr_y1+2, mag_start, clock_line_hr_y2-2);
				//dc.drawLine(mag_end, clock_line_hr_y1+2, mag_end, clock_line_hr_y2-2);
				//dc.drawLine(mag_start, clock_line_hr_y1+2, mag_end, clock_line_hr_y1+2);
				//dc.drawLine(mag_start, clock_line_hr_y2-2, mag_end, clock_line_hr_y2-2);
				
			//	var mina = "";
			//	if(min-2>0) {
			//		if(min-2 < 10) { 
			//			mina = Lang.format("0$1$", [min-2]);
			//		} else {
			//			mina = Lang.format("$1$", [min-2]);
			//		}
			//	} else if ( min - 2 == -2 ) {
			//		var mintemp = 60-min;
			//		mina = "58";
			//	} else if ( min - 2 == -1 ) {
			//		mina = "59";
			//	}
			//	var minb = "";
			//	if(min-1>0) {
			//		if(min-1 < 10) { 
			//			minb = Lang.format("0$1$", [min-1]);
			//		} else {
			//			minb = Lang.format("$1$", [min-1]);
			//		}
			//	} else if ( min - 1 == -1) {
			//		minb = "59";
			//	}
			//	var mind = "";
			//	if(min+1 < 60) {
			//		mind = Lang.format("0$1$", [min+1]);
			//		if(min+1 < 10) { 
			//			mind = Lang.format("0$1$", [min+1]);
			//		} else {
			//			mind = Lang.format("$1$", [min+1]);
			//		}
			//	} else if ( min + 1 == 60) {
			//		mind = "00";
			//	}
			//	var mine = "";
			//	if(min+2 < 60) {
			//		if(min+2 < 10) { 
			//			mine = Lang.format("0$1$", [min+2]);
			//		} else {
			//			mine = Lang.format("$1$", [min+2]);
			//		}
			//	} else if ( min + 2 == 61 ) {
			//		mine = "01";
			//	} else if ( min + 2 == 60 ) {
			//		mine = "00";
			//	}	
			//	
			//	var minc = "";
			//	if(min < 10) { 
			///		minc = Lang.format("0$1$", [min]);
			//	} else {
			//		minc = Lang.format("$1$", [min]);
			//	}
			//	
			//	dc.drawText(mag_start+10, clock_line_hr_y1, Gfx.FONT_TINY, mina, Gfx.TEXT_JUSTIFY_CENTER);
			//	dc.drawText(mag_start+25, clock_line_hr_y1, Gfx.FONT_TINY, minb, Gfx.TEXT_JUSTIFY_CENTER);
			//	dc.drawText(mag_start+40, clock_line_hr_y1, Gfx.FONT_TINY, minc, Gfx.TEXT_JUSTIFY_CENTER);
			//	dc.drawText(mag_start+55, clock_line_hr_y1, Gfx.FONT_TINY, mind, Gfx.TEXT_JUSTIFY_CENTER);
			//	dc.drawText(mag_start+70, clock_line_hr_y1, Gfx.FONT_TINY, mine, Gfx.TEXT_JUSTIFY_CENTER);
			//}
			
			//
	        //Step Goal Bar
			//
	
			//TBD
		}

		//This is the last thing to do
		if( barColor == 0 ) {
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);	
		}
		else if( barColor == 1 ) {
			dc.setColor( Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
		}
		else if( barColor == 2 ){
			dc.setColor( Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
		}
		else if( barColor == 3 ){
			dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
		}
		else if( barColor == 4 ){
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
		}
		else if( barColor == 5 ){
			dc.setColor( Gfx.COLOR_DK_RED, Gfx.COLOR_TRANSPARENT);
		}
		else if( barColor == 6 ){
			dc.setColor( 0xFF6600, Gfx.COLOR_TRANSPARENT);			
		}
		else if( barColor == 7 ){
			dc.setColor( Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);			
		}
		else if( barColor == 8 ){
			dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);			
		}
		else if( barColor == 9 ){
			dc.setColor( Gfx.COLOR_DK_GREEN, Gfx.COLOR_TRANSPARENT);			
		}
		else if( barColor == 10 ){
			dc.setColor( Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);			
		}
		else if( barColor == 11 ){
			dc.setColor( Gfx.COLOR_DK_BLUE, Gfx.COLOR_TRANSPARENT);			
		}
		else if( barColor == 12 ){
			dc.setColor( 0x5500AA, Gfx.COLOR_TRANSPARENT);		
		}
		else if( barColor == 13 ){
			dc.setColor( Gfx.COLOR_PINK, Gfx.COLOR_TRANSPARENT);			
		}
		
		var barThick = Application.getApp().getProperty("barThickness");
		
		if(barThick==0) {
				
		}
		else if(barThick==1) {
			dc.drawLine(w/2, 0, w/2, h);	
		}
		else if(barThick==2) {
			dc.drawLine(w/2 + 1, 0, w/2 + 1, h);
			dc.drawLine(w/2, 0, w/2, h);	
		}
		else if(barThick==3) {
			dc.drawLine(w/2 + 1, 0, w/2 + 1, h);
			dc.drawLine(w/2, 0, w/2, h);
			dc.drawLine(w/2 - 1, 0, w/2 - 1, h);	
		}
		
		dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
    }

    //! The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    //! Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}