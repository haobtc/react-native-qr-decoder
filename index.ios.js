
var QRDecoder = require('NativeModules').React_native_qr_decoder;

var path = "your qr code full path";

// From local File
QRDecoder.get(path, (error, qrcode) => {
    console.log(qrcode);
    if (error) {
      console.log(error);
      return
    } else {
      console.log(qrcode);

      // this.setState({qrcode: qrcode});
    }
});