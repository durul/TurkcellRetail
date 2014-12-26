//  MoviePlayerUserPrefs
//  turkcellretail2Tests
//
//  Created by ddalkanat on 24/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MoviePlayerUserPrefs : NSObject 
{
}

+ (MPMovieScalingMode)scalingModeUserSetting;
+ (MPMovieControlStyle)controlStyleUserSetting;
+ (UIColor *)backgroundColorUserSetting;
+ (MPMovieRepeatMode)repeatModeUserSetting;
+ (BOOL)backgroundImageUserSetting;

@end
