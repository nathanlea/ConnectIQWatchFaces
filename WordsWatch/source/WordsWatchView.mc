using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Math as Math;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class WordsWatchView extends Ui.WatchFace {
	
	//! Constructor
    function initialize()
    {
    }
    
    function onLayout(dc)
    {
    }
    
    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        // Get and show the current time
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
        //dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        
        var clockTime = Sys.getClockTime();
        var hour = Sys.getClockTime().hour;
        var min = Sys.getClockTime().min;
        //var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%.2d")]);
        var info = Calendar.info(Time.now(), Time.FORMAT_LONG);
        //var view = View.findDrawableById("TimeLabel");
        //view.setText(timeString);
		var ftHeight = dc.getFontHeight(dc.FONT_TINY)-5;
		var lw = dc.getTextWidthInPixels("A ", dc.FONT_TINY)+3;
		var ft_H = 0;
		var past = true;
		var until = false;
		//Line 1
		dc.drawText(2,    0, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw,    0, dc.FONT_TINY, "D", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*2,    0, dc.FONT_TINY, "P", Gfx.TEXT_JUSTIFY_CENTER);
		dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*3,    0, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*4,    0, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3,    0, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*4,    0, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3,    0, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*4,    0, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*5,    0, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
		dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*6,    0, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*7,    0, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6,    0, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*7,    0, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6,    0, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*7,    0, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*8,    0, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*9,    0, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*10,    0, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*11,    0, dc.FONT_TINY, "C", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,    0, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*13,    0, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		
		//Line 2
		dc.drawText(2, ftHeight, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw, ftHeight, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		if( (min >=15 && min < 20) || (min >=45 && min < 50)) {
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*2, ftHeight, dc.FONT_TINY, "Q", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ftHeight, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ftHeight, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ftHeight, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ftHeight, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ftHeight, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ftHeight, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ftHeight, dc.FONT_TINY, "Q", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ftHeight, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ftHeight, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ftHeight, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ftHeight, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ftHeight, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ftHeight, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		} 
		dc.drawText(2+lw*2, ftHeight, dc.FONT_TINY, "Q", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3, ftHeight, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*4, ftHeight, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*5, ftHeight, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6, ftHeight, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*7, ftHeight, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*8, ftHeight, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*9, ftHeight, dc.FONT_TINY, "M", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*10,ftHeight, dc.FONT_TINY, "C", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*11,ftHeight, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,ftHeight, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*13,ftHeight, dc.FONT_TINY, "G", Gfx.TEXT_JUSTIFY_CENTER);
		
		//Line 3
		ft_H = ftHeight*2;
		dc.drawText(2, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		if((min>=20 && min<30) || (min>=35 && min < 45)) {
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "Y", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "Y", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "Y", Gfx.TEXT_JUSTIFY_CENTER);
		//normal font here
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		if((min>=5 && min < 10) || ( min >= 25 && min < 30) || ( min >= 35 && min < 40 ) || ( min >= 55 && min <= 59)) {
			//White font here
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal font here
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		if((min >=10 && min < 15) || (min >= 50 && min < 55)) {
			//White font here		
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal Font
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		
		//Line4
		ft_H = ftHeight*3;
		if(min>=30 && min < 35) {
			//White font
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2, ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2, ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2, ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal Font
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "Z", Gfx.TEXT_JUSTIFY_CENTER);
		if(min > 5 && min < 35) {
			//White font here	
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			past = true;
			until = false;	
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "P", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "P", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "P", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		//Noraml font
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		if(min >=35 && min <=59) {
			//White font	
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			past = false;
			until = true;
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		//Noraml font		
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		
		//Line5
		ft_H = ftHeight*4;
		if((hour == 2 && past) || (hour == 1 && until) || (hour == 14 && past) || (hour == 13 && until)) {
			//White font
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal font
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		if((hour == 3 && past) || (hour == 2 && until) || (hour == 15 && past) || (hour == 14 && until)) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);			
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		//Noraml font
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "D", Gfx.TEXT_JUSTIFY_CENTER);
		if((hour == 4 && past) || (hour == 3 && until) || (hour == 16 && past) || (hour == 15 && until)) {
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "U", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal Font
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		
		//Line6
		ft_H = ftHeight*5;
		if((hour == 5 && past) || (hour == 4 && until) || (hour == 17 && past) || (hour == 16 && until)) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal font
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "Q", Gfx.TEXT_JUSTIFY_CENTER);
		if((hour == 6 && past) || (hour == 5 && until) || (hour == 18 && past) || (hour == 17 && until)) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "X", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "X", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "X", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal font
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		if((hour == 8 && past) || (hour == 7 && until) || (hour == 20 && past) || (hour == 19 && until)) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "G", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "G", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "G", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "H", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		
		//Line7
		ft_H = ftHeight*6;
		
		if((hour == 11 && past) || (hour == 10 && until) || (hour == 23 && past) || (hour == 22 && until)) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		//noraml
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		
		if((hour == 9 && past) || (hour == 8 && until) || (hour == 21 && past) || (hour == 20 && until)
			|| (hour == 11 && past) || (hour == 10 && until) || (hour == 23 && past) || (hour == 22 && until)) {
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);		
		}
		dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		
		if((hour == 9 && past) || (hour == 8 && until) || (hour == 21 && past) || (hour == 20 && until)) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
				
		
		//noraml
		if((hour == 7 && past) || (hour == 6 && until) || (hour == 19 && past) || (hour == 18 && until)) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "S", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		//noraml
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		
		//Line8
		ft_H = ftHeight*7;
		dc.drawText(2, ft_H, dc.FONT_TINY, "I", Gfx.TEXT_JUSTIFY_CENTER);
		if((hour == 12 && past) || (hour == 11 && until) || (hour == 0 && past) || (hour == 23 && until)) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "W", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "V", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		//normal
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		if((hour == 1 && past) || (hour == 0 && until) || (hour == 13 && past) || (hour == 12 && until)) {
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		if((hour == 10 && past) || (hour == 9 && until) || (hour == 22 && past) || (hour == 21 && until)) {
		dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
		
		}
		dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "E", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "N", Gfx.TEXT_JUSTIFY_CENTER);
		//noraml
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "P", Gfx.TEXT_JUSTIFY_CENTER);
		
		//Line9
		ft_H = ftHeight*8;
		dc.drawText(2, ft_H, dc.FONT_TINY, "T", Gfx.TEXT_JUSTIFY_CENTER);
		if(min >=0 && min < 5) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "C", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "C", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "K", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "C", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "C", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "K", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*2, ft_H, dc.FONT_TINY, "C", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*3, ft_H, dc.FONT_TINY, "L", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*4, ft_H, dc.FONT_TINY, "O", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*5, ft_H, dc.FONT_TINY, "C", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*6, ft_H, dc.FONT_TINY, "K", Gfx.TEXT_JUSTIFY_CENTER);
		//Normal
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*7, ft_H, dc.FONT_TINY, "F", Gfx.TEXT_JUSTIFY_CENTER);
		if( ( hour < 12 || ( hour == 23 && until ) ) && !( hour == 11 && until ) ) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "M", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "M", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*8, ft_H, dc.FONT_TINY, "A", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*9, ft_H, dc.FONT_TINY, "M", Gfx.TEXT_JUSTIFY_CENTER);
		//noraml
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*10,ft_H, dc.FONT_TINY, "Y", Gfx.TEXT_JUSTIFY_CENTER);
		if( ( hour >= 12 ||  ( hour == 11 && until ) ) && !(hour == 23 && until) ) {
			//white
			dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "P", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "M", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "P", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "M", Gfx.TEXT_JUSTIFY_CENTER);
		}
		dc.drawText(2+lw*11,ft_H, dc.FONT_TINY, "P", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(2+lw*12,ft_H, dc.FONT_TINY, "M", Gfx.TEXT_JUSTIFY_CENTER);
		//normal
		dc.setColor( 0x404040, Gfx.COLOR_TRANSPARENT );
		dc.drawText(2+lw*13,ft_H, dc.FONT_TINY, "R", Gfx.TEXT_JUSTIFY_CENTER);
		
		//Line10
		ft_H = (ftHeight*9)+2;
		var center = dc.getWidth()/2;
		dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
		
		var end_s = Lang.format("$2$ $1$ -- $3$%", [info.month, info.day, Sys.getSystemStats().battery.toNumber()]);
		//var end_s = Lang.format("1 Jan -- $3$%", [info.month, info.day, Sys.getSystemStats().battery.toNumber()+99]);
		dc.drawText(center, ft_H, dc.FONT_TINY, end_s, Gfx.TEXT_JUSTIFY_CENTER);

    }

    //! The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    //! Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}