//
//  RegisterViewController.h
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CoreLocation/CoreLocation.h>
#import "FXImageView.h"

@class THCrystalBall;
@interface RegisterViewController : UIViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>{
    int cents;
    NSString* emailText;
}

@property (strong, nonatomic) THCrystalBall *crystalBall;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (readwrite, assign) BOOL checked;
@property (weak, nonatomic) IBOutlet FXImageView *logo;

//Parse: Customer save e-mail & sms
-(IBAction)signUpUser:(id)sender;


//Checkbox Buttom configuration
@property (weak, nonatomic) IBOutlet UIButton *checkBoxBtn;
- (IBAction)checkBtn:(id)sender;

@end
