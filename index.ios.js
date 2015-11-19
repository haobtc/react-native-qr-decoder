
var QRDecoder = require('NativeModules').React_native_qr_decoder;

QRDecoder.get(path, qrcode => {
    console.log(qrcode);
});