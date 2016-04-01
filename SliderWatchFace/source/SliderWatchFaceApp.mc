using Toybox.Application as App;

class SliderWatchFaceApp extends App.AppBase {

    //! onStart() is called on application start up
    function onStart() {
    	Application.getApp().setProperty("appVersion", "2.5.4");
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new SliderWatchFaceView() ];
    }

}