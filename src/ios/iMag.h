//
//  iMag.h
//
//  iMag SDK 2.8
//  base on v2.7
//  Modified by XinHu Li on 27/08/14
//  Copyright 2014 ID TECH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import	<ExternalAccessory/ExternalAccessory.h>

#define IMLOG_INFO     @"[IM Info] "

@interface iMag : NSObject <EAAccessoryDelegate, NSStreamDelegate> {

	EASession *session;
}


-(id)init;


@property (readonly) BOOL iMagConnected;

-(NSData*) SendCMD:(NSData*)writeBuf;
-(NSData*) SendCMDGetVersion;
-(NSData*) SendCMDGetSerialNumber;

+(void) enableLogging:(BOOL)enable;

@end
