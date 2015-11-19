//
//  react_native_qr_decoder.m
//  react-native-qr-decoder
//
//  Created by phil on 15/11/19.
//  Copyright © 2015 phil. All rights reserved.
//

#import "react_native_qr_decoder.h"
#import <UIKit/UIKit.h>
#import "RCTBridge.h"
#import "RCTLog.h"
#import "RCTUtils.h"
#import "RCTEventDispatcher.h"

@implementation React_native_qr_decoder

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(get:(NSString *)path callback:(RCTResponseSenderBlock)callback)
{
    // Change this depending on what you want to retrieve:
    NSString* qrcodeImage = path;
    NSLog(@"qrcodeImage: %@", qrcodeImage);

	UIImage *srcImage = [[UIImage alloc] initWithContentsOfFile:qrcodeImage];
    if (nil==srcImage){
        NSLog(@"PROBLEM! IMAGE NOT LOADED\n");
        callback(@[RCTMakeError(@"IMAGE NOT LOADED!", nil, nil)]);
        return;
    }else
        NSLog(@"OK - IMAGE LOADED\n");
	// [srcImage release];

    NSDictionary *detectorOptions = @{@"CIDetectorAccuracy": @"CIDetectorAccuracyHigh"};
	CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:detectorOptions];
	CIImage *image = [CIImage imageWithCGImage:srcImage.CGImage];
	NSArray *features = [detector featuresInImage:image];
    NSLog(@"Feature size: %d", features.count);
    if (0==features.count){
        NSLog(@"PROBLEM! Feature size is zero!\n");
        callback(@[RCTMakeError(@"Feature size is zero!", nil, nil)]);
        return;
    }
    
	CIQRCodeFeature *feature = [features firstObject];

	NSString *result = feature.messageString;
	NSLog(@"result: %@", result);

	if (result)
	{
		/* code */
		callback(@[[NSNull null], result]);
	}else{
    	callback(@[RCTMakeError(@"QR Parse failed!", nil, nil)]);
    	return;
	}
}

@end
