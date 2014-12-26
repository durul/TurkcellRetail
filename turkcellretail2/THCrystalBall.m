//
//  THCrystalBall.m
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "THCrystalBall.h"

@implementation THCrystalBall
@synthesize predictions = _predictions;

- (NSArray *) predictions {
    
    if (_predictions == nil){
        _predictions = [[NSArray alloc] initWithObjects:@"It is certain",@"It is decidedly so",@"All signs say YES",
                        @"The stars are not aligned",
                        @"My reply is no",
                        @"It is doubtful",
                        @"Better not tell you now",
                        @"Concentrate and ask again",
                        @"Unable to answer now", nil];
    }
    return _predictions;
}

- (NSString*) randomPrediction {
    NSUInteger randomInt;
    if (self.predictions.count <= UINT_MAX) {
        randomInt = arc4random_uniform((unsigned int)self.predictions.count);
    } else {
        // Handle it
        // randomInt = something else;
    }
    
    return [self.predictions objectAtIndex:randomInt];
}


@end


