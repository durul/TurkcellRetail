//
//  Utils.h
//  turkcellretail2
//
//  Created by ddalkanat on 24/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+iPhone5.h"

@interface Utils : NSObject

+(BOOL)isVersion6AndBelow;

+(UIImage*)createSolidColorImageWithColor:(UIColor*)color andSize:(CGSize)size;

@end
