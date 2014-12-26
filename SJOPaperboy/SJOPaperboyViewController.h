//
//  PaperboyViewController.h
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <CoreLocation/CoreLocation.h>

@class IPInsetLabel;
@interface SJOPaperboyViewController : UITableViewController<CLLocationManagerDelegate>


@property (nonatomic, strong) UIFont *labelFont;
@property (nonatomic, strong) CLLocationManager *locationManager;
+ (BOOL) isBackgroundUpdatingEnabled;
+ (BOOL) isLocationUpdatingEnabled;
+ (void) setDefaultBackgroundValue:(BOOL) isBackgroundingEnabled;
+ (void) setDefaultLocationUpdateValue:(BOOL) areLocationUpdatesEnabled;
+ (NSArray*) locationsForUpdate;

@end
