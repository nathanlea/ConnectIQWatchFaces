using Toybox.Application as App;

class SliderWatchFaceApp extends App.AppBase {

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
    	var view  = new SliderWatchFaceView( );
    	var propA = App.getApp().getProperty("24hrMode");
    	view.setProp( propA, view );
        return [ view ];
    }

}