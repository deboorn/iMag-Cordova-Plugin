# iMag Pro  Cordova Plugin

iMag Pro Cordova Plugin for use with iMag Pro Mobile MagStripe Reader for iOS. <b>In order to publish any application using the iMag Pro you must purchase a development kit from ID Tech directly. You must contact ID Tech to purchase a development kit prior to using this plugin. This plugin is to serve as an 3rd party addition to the paid iMag Pro SDK provided with the purchase of ID Tech's iMag dev kit. See iMag FAQ on ID Tech website for more information.</b> It's recommended that you 1st test your device using the iMag demo in the iTunes market prior to development.

More Info on iMag Pro Reader: <br>
http://www.idtechproducts.com/products/mobile-readers/125.html

Short Demo: <br>
https://www.youtube.com/watch?v=IvbQ5cFjVxs&feature=youtu.be

### License

CC BY-NC 4.0 http://creativecommons.org/licenses/by-nc/4.0/<br>
Core iMag iOS SDK files are Copyright of their Respective Owners.

### Installation & Usage

Installation Step 1: Add Plugin to App Project
```
$ cordova plugin add https://github.com/deboorn/iMag-Cordova-Plugin
```
Step 2: Add a plugin definition to the `config.xml`
```
<feature name="iMagPlugin">
    <param name="ios-plugin" value="iMagPlugin" />
</feature>
```

Step 3: Invoke plugin from HTML
```
//place in your application js, document must be loaded prior to invoking
  imag.start(function(result){
      alert(result);
  }, function(error){
      alert("Error: " + error);
  });
```

The 1st param is the result handler followed by the error handler. iMag events will be sent to the result handler. 
Events include:
- "Connected" - For notification of iMag reconnection only.
- "Disconnected" - For notification of iMag disconnection.
- OR, card data, where card data is from a swipe

Step4: Add iOS Platform & Build
```
$ cordova platform add ios
$ cordova build ios
```

What's Next?<br>
- Open the project in XCode and run on device.
- Refactor the resultHander and errorHander in Step 3.

iMagPlugin Methods:
- `imag.start(resultHandler, errorHandler)` - Get disconnect, connect and swipe events.
- `imag.isConnected(resultHandler, errorHandler)` - Get current device status of iMag device.