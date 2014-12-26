//
//  ViewController.h
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CoreLocation/CoreLocation.h>
#import "FXImageView.h"

@class THCrystalBall;

@interface ViewController : UIViewController
@property (strong, nonatomic) THCrystalBall *crystalBall;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet FXImageView *logo;

//Uygulamayı kapatıyor
- (IBAction)exit_app:(id)sender;
- (IBAction)video:(id)sender;

@end
