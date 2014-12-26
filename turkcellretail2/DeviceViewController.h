//
//  DeviceViewController.h
//  turkcellretail2
//
//  Created by ddalkanat on 07/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import "FXImageView.h"

@interface DeviceViewController : UIViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet FXImageView *image2;
@property (weak, nonatomic) IBOutlet FXImageView *image1;

@property (weak, nonatomic) IBOutlet UITableView *mytableView;
@property (weak, nonatomic) IBOutlet UIView *campaign;

@end
