//
//  DeviceDetailViewController.h
//  turkcellretail2
//
//  Created by ddalkanat on 12/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Device.h"
#import "AutoTextView.h"

@interface DeviceDetailViewController : UIViewController<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *devicePhoto;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeLabel;
@property (weak, nonatomic) IBOutlet AutoTextView *ingredientTextView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (nonatomic, strong) Device *device;

@end
