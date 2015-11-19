//
//  react_native_qr_decoder.m
//  react-native-qr-decoder
//
//  Created by phil on 15/11/19.
//  Copyright © 2015年 phil. All rights reserved.
//

#import "react_native_qr_decoder.h"
#import <UIKit/UIKit.h>


@implementation React_native_qr_decoder

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(get:(NSString *)path callback:(RCTResponseSenderBlock)callback)
{
    // Change this depending on what you want to retrieve:
    NSString* qrcodeImage = path;
    
	UIImage *srcImage = [[UIImage alloc] initWithContentsOfFile:qrcodeImage]; 
	// [srcImage release];

	CIContext *context = [CIContext contextWithOptions:nil];
	CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
	CIImage *image = [CIImage imageWithCGImage:srcImage.CGImage];
	NSArray *features = [detector featuresInImage:image];
	CIQRCodeFeature *feature = [features firstObject];

	NSString *result = feature.messageString;

    callback(@[result]);
}

@end
