# react-native-qr-decoder 

A QR decode module for React Native.


## Getting started

1. `npm install react-native-qr-decoder@latest --save`
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. Go to `node_modules` ➜ `react-native-qr-decoder` and add `react-native-qr-decoder.xcodeproj`
4. In XCode, in the project navigator, select your project. Add `libRCTCamera.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
5. Click `react-native-qr-decoder.xcodeproj` in the project navigator and go the `Build Settings` tab. Make sure 'All' is toggled on (instead of 'Basic'). In the `Search Paths` section, look for `Header Search Paths` and make sure it contains both `$(SRCROOT)/../../react-native/React` and `$(SRCROOT)/../../../React` - mark both as `recursive`.
5. Run your project (`Cmd+R`)

## Usage

All you need is to `require` the `react-native-qr-decoder` module and then use the
`<Camera/>` tag.

```javascript

var QRDecoder = require('NativeModules').React_native_qr_decoder;

QRDecoder.get(path, qrcode => {
    console.log(qrcode);
});
```

