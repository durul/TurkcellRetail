//
//  Device.h
//  turkcellretail2
//
//  Created by ddalkanat on 12/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

@property (nonatomic, strong) NSString *name; // name of Device
@property (nonatomic, strong) NSString *prepTime; // preparation time
@property (nonatomic, strong) NSString *image; // image filename of Device
@property (nonatomic, strong) NSArray *ingredients; // ingredients of Device

@property (nonatomic, strong) NSString *imagedetail; // image filename of Device

@end
