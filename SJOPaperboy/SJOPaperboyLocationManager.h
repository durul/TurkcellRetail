//
//  PaperboyLocationManager.h
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface SJOPaperboyLocationManager : NSObject<CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager* locationManager;
@property (copy, nonatomic) dispatch_block_t locationChangedBlock;
+ (CLLocationManager*) sharedLocationManager;
+ (SJOPaperboyLocationManager*) sharedInstance;
@end
