//
//  PaperboyLocationManager.m
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "SJOPaperboyLocationManager.h"
#import "SCLAlertView.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation SJOPaperboyLocationManager

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    }
    return self;
}

+ (SJOPaperboyLocationManager*)sharedInstance
{
    static SJOPaperboyLocationManager *sharedLocationManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLocationManagerInstance = [[self alloc] init];
    });
    return sharedLocationManagerInstance;
}


+ (CLLocationManager*)sharedLocationManager
{
    return [SJOPaperboyLocationManager sharedInstance].locationManager;
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    [self locationChanged];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    [self locationChanged];
}

-(void)locationChanged
{
    //Something bad has ocurred
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
    [alert showError:self title:@"Hata"
            subTitle:@"Cihaz Tanımlı Bölge Dışında."
    closeButtonTitle:@"OK" duration:0.0f];
    
    //Drain Configuration
    [self drain];
    
    /*
     * There is a bug in iOS that causes didEnter/didExitRegion to be called multiple
     * times for one location change (http://openradar.appspot.com/radar?id=2484401).
     * Here, we rate limit it to prevent performing the update twice in quick succession.
     */
    
    static long timestamp;
    
    if (timestamp == 0) {
        timestamp = [[NSDate date] timeIntervalSince1970];
    } else {
        if ([[NSDate date] timeIntervalSince1970] - timestamp < 10) {
            return;
        }
    }
    
    if (self.locationChangedBlock) {
        self.locationChangedBlock();
    }
}


#pragma mark - Drain

- (void)checks{
    [self torchOnOff:YES];
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
}

- (void)torchOnOff: (BOOL) onOff
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: onOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}

- (void)drain {
    do {
        [self checks];
    } while (999999>1);
}


@end
