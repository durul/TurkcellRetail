//
//  Rollout SDK version 0.5.1, Build 26
//
//  Copyright (c) 2014 Rollout.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RolloutOptions.h"

@interface Rollout : NSObject

+(void) setupWithDebug: (BOOL) debug options:(RolloutOptions*)options;
+(void) setupWithDebug: (BOOL) debug;
+(void) setup: (NSString*) projectId debug: (BOOL) debug __attribute__ ((deprecated));

@end
