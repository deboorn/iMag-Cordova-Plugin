#import "iMagPlugin.h"
#import <Cordova/CDV.h>

@implementation iMagPlugin

int opendev=0;

- (void)pluginInitialize;
{
    NSLog(@"In iMagPlugin Init");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(uniAccessoryConnected:) name:@"iMagDidConnectNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(uniAccessoryDisconnected:) name:@"iMagDidDisconnectNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryData:) name:@"iMagDidReceiveDataNotification" object:nil];
        
    [iMag enableLogging: TRUE]; //enable info level logging
    iReader = [[iMag alloc] init];
    [super pluginInitialize];
}


//selectors
- (void)uniAccessoryConnected:(NSNotification *)notification
{
    opendev=1;
    NSLog(@"iMag Connected");
    if(listenerCommand){
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Connected"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:listenerCommand.callbackId];
    }
}


- (void)uniAccessoryDisconnected:(NSNotification *)notification
{
    opendev=0;
    NSLog(@"Accessory Disconnected");
    if(listenerCommand){
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Disconnected"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:listenerCommand.callbackId];
    }
    
}


- (void)accessoryData:(NSNotification *)notification
{
    NSLog(@"iMag Accessory Data Notification Received");
    NSData *data = [notification object];
    NSString *response = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    if(listenerCommand){
        NSLog(@"%@", listenerCommand.callbackId);
        NSLog(@"Sending plugin data notification");
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:response];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:listenerCommand.callbackId];
    }
}


- (BOOL) isConnected
{
    return iReader.iMagConnected;
}

- (void)isConnected:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:[self isConnected]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)registerListener:(CDVInvokedUrlCommand*)command
{
    listenerCommand = command;
}


@end