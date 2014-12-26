//
//  RegisterViewController.m
//  TutorialBase
//
//  Created by Antonio MG on 6/27/12.
//  Copyright (c) 2012 AMG. All rights reserved.
//

#import "RegisterViewController.h"
#import "THCrystalBall.h"
#import <AudioToolbox/AudioToolbox.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import <Parse/Parse.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SCLAlertView.h"
#import "SAHighlightedTextField.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet SAHighlightedTextField *userRegisterText;
@property (weak, nonatomic) IBOutlet SAHighlightedTextField *emailRegisterText;

@end

NSString *kSuccessTitle = @"Tebrikler";
NSString *kErrorTitle = @"Bağlantı Hatası";
NSString *kNoticeTitle = @"Dikkat";
NSString *kWarningTitle = @"Uyarı";
NSString *kInfoTitle = @"Bilgi";
NSString *kButtonTitle = @"Tamam";


@implementation RegisterViewController
@synthesize userRegisterText, emailRegisterText,checkBoxBtn,checked;
@synthesize backgroundImageView,logo;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    logo.reflectionScale = 3.5f;
    logo.reflectionScale = 0.5f;
    logo.reflectionGap = 20.0f;
    logo.shadowOffset = CGSizeMake(0.0f, 4.0f);
    logo.shadowBlur = 5.0f;
    logo.cornerRadius = 10.0f;
    logo.customEffectsBlock = ^(UIImage *image){
        
        //create drawing context
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
        
        //draw image
        [image drawAtPoint:CGPointZero];
        
        //capture resultant image
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //return image
        return image;};

    
    //Textfield Configuration
    [self.userRegisterText configureWithBackgroundImage:[UIImage imageNamed:@"text-input"] andHighlightedImage:[UIImage imageNamed:@"text_field_editing"] withResizeCapInsets:UIEdgeInsetsMake(0.0f, 8.0f, 0.0f, 8.0f)];
    self.userRegisterText.textInsets = CGSizeMake(6.0f, 4.0f);
    self.userRegisterText.textOffset = CGPointMake(35.0f, 0.0f);
    //self.userRegisterText.textColor = [UIColor whiteColor];
    
    [self.emailRegisterText configureWithBackgroundImage:[UIImage imageNamed:@"text-input"] andHighlightedImage:[UIImage imageNamed:@"text_field_editing"] withResizeCapInsets:UIEdgeInsetsMake(0.0f, 8.0f, 0.0f, 8.0f)];
    self.emailRegisterText.textInsets = CGSizeMake(6.0f, 4.0f);
    self.emailRegisterText.textOffset = CGPointMake(35.0f, 0.0f);

    //checkbox button default configuration
    checked = NO;
    
    
    //Custom Navbar right icon
    UIImage* image = [UIImage imageNamed:@"sahne_2@2x.png"];
    CGRect frameimg = CGRectMake(0, 0, 15, 23);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=button;

    
    //Core Animation
    self.crystalBall = [[THCrystalBall alloc] init];
    self.backgroundImageView.animationImages = [[NSArray alloc] initWithObjects:
                                                [UIImage imageNamed:@"1_00000"],
                                                [UIImage imageNamed:@"1_00001"],
                                                [UIImage imageNamed:@"1_00002"],
                                                [UIImage imageNamed:@"1_00003"],
                                                [UIImage imageNamed:@"1_00004"],
                                                [UIImage imageNamed:@"1_00005"],
                                                [UIImage imageNamed:@"1_00006"],
                                                [UIImage imageNamed:@"1_00007"],
                                                [UIImage imageNamed:@"1_00008"],
                                                [UIImage imageNamed:@"1_00009"],
                                                [UIImage imageNamed:@"1_00010"],
                                                [UIImage imageNamed:@"1_00011"],
                                                [UIImage imageNamed:@"1_00012"],
                                                [UIImage imageNamed:@"1_00013"],
                                                [UIImage imageNamed:@"1_00014"],
                                                [UIImage imageNamed:@"1_00015"],
                                                [UIImage imageNamed:@"1_00016"],
                                                [UIImage imageNamed:@"1_00017"],
                                                [UIImage imageNamed:@"1_00018"],
                                                [UIImage imageNamed:@"1_00019"],
                                                [UIImage imageNamed:@"1_00020"],
                                                [UIImage imageNamed:@"1_00021"],
                                                [UIImage imageNamed:@"1_00022"],
                                                [UIImage imageNamed:@"1_00023"],
                                                [UIImage imageNamed:@"1_00024"],
                                                [UIImage imageNamed:@"1_00025"],
                                                [UIImage imageNamed:@"1_00026"],
                                                [UIImage imageNamed:@"1_00027"],
                                                [UIImage imageNamed:@"1_00028"],
                                                [UIImage imageNamed:@"1_00029"],
                                                [UIImage imageNamed:@"1_00030"],
                                                [UIImage imageNamed:@"1_00031"],
                                                [UIImage imageNamed:@"1_00032"],
                                                [UIImage imageNamed:@"1_00033"],
                                                [UIImage imageNamed:@"1_00034"],
                                                [UIImage imageNamed:@"1_00035"],
                                                [UIImage imageNamed:@"1_00036"],
                                                [UIImage imageNamed:@"1_00037"],
                                                [UIImage imageNamed:@"1_00038"],
                                                [UIImage imageNamed:@"1_00039"],
                                                [UIImage imageNamed:@"1_00040"],
                                                [UIImage imageNamed:@"1_00041"],
                                                [UIImage imageNamed:@"1_00042"],
                                                [UIImage imageNamed:@"1_00043"],
                                                [UIImage imageNamed:@"1_00044"],
                                                [UIImage imageNamed:@"1_00045"],
                                                [UIImage imageNamed:@"1_00046"],
                                                [UIImage imageNamed:@"1_00047"],
                                                [UIImage imageNamed:@"1_00048"],
                                                [UIImage imageNamed:@"1_00049"],
                                                [UIImage imageNamed:@"1_00050"],
                                                [UIImage imageNamed:@"1_00051"],
                                                [UIImage imageNamed:@"1_00052"],
                                                [UIImage imageNamed:@"1_00053"],
                                                [UIImage imageNamed:@"1_00054"],
                                                [UIImage imageNamed:@"1_00055"],
                                                [UIImage imageNamed:@"1_00056"],
                                                [UIImage imageNamed:@"1_00057"],
                                                [UIImage imageNamed:@"1_00058"],
                                                [UIImage imageNamed:@"1_00059"],nil];
    self.backgroundImageView.animationDuration = 2.5f;
    self.backgroundImageView.animationRepeatCount = 1000000000;
    //AutoStart
    [backgroundImageView startAnimating];
    
}

- (void)viewDidAppear:(BOOL)animated {

}


#pragma mark IB Actions

////Sign Up Button pressed
-(IBAction)signUpUser:(id)sender
{
    [self checkFieldsComplete];

    
}

- (void) checkFieldsComplete {
    if ([userRegisterText.text isEqualToString:@""] || [emailRegisterText.text isEqualToString:@""] || (!checked)) {
        //Something bad has ocurred
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
        [alert showError:self title:@"Hata"
                subTitle:@"Lütfen girişleri tamamlayınız."
        closeButtonTitle:@"OK" duration:0.0f];
    }
    else {
        [self registerNewUser];
        [self sendmail];
    }
}

- (IBAction)dismissKeyboardTxt:(id)sender {
    
    [userRegisterText resignFirstResponder];
    [emailRegisterText resignFirstResponder];
    
}

#pragma mark - checkButton
- (IBAction)checkBtn:(id)sender {
    if (!checked) {
        [checkBoxBtn setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        checked = YES;
    }
    
    else if (checked) {
        [checkBoxBtn setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        checked = NO;
    }
}



#pragma mark - Prediction
- (void) makePrediction {
    [self.backgroundImageView startAnimating];
    //self.predictionLabel.text = [self.crystalBall randomPrediction];
    
    [UIView animateWithDuration:6.0 animations:^{
        //  self.predictionLabel.alpha = 1.0f;
    }];
}

#pragma mark - Motion Events

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    // self.predictionLabel.text = nil;
    // self.predictionLabel.alpha = 0.0f;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if ( motion == UIEventSubtypeMotionShake ){
        [self makePrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    //NSLog(@"motion cancelled");
}

#pragma mark - Touch Events

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // self.predictionLabel.text = nil;
    // self.predictionLabel.alpha = 0.0f;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makePrediction];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    // NSLog(@"touches cancelled");
}


- (void) registerNewUser {
    //NSLog(@"registering....");
    PFUser *user = [PFUser user];
    user.username = self.userRegisterText.text;
    user.email = self.emailRegisterText.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
            [alert showSuccess:self title:kSuccessTitle subTitle:kWarningTitle closeButtonTitle:kButtonTitle duration:0.0f];
            
        } else {
            //Something bad has ocurred
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
            [alert showError:self title:@"Hata"
                    subTitle:@"Problem var."
            closeButtonTitle:@"OK" duration:0.0f];
        }
    }];
    
}

- (void) sendmail {
    [self.userRegisterText resignFirstResponder];
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:self.userRegisterText.text];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"email@domain.com", nil];
        [mailer setToRecipients:toRecipients];
        [mailer setMessageBody:@"" isHTML:YES];
        
        //sample add some image
        UIImage* imgToAttach = [UIImage imageNamed:@"mail.png"];
        NSData *data = UIImageJPEGRepresentation(imgToAttach, 1.0);
        [mailer addAttachmentData:data mimeType:@"image/png" fileName:@"mail.png"];
        [self presentViewController:mailer animated:YES completion:nil];

    }
}



#pragma mark - MFMessageComposeViewControllerDelegate methods
- (void) messageComposeViewController:(MFMessageComposeViewController *)controller
                  didFinishWithResult:(MessageComposeResult)result {
    
    
    NSString *resultStringSms;
    
    switch (result) {
        case MessageComposeResultCancelled:
            resultStringSms = @"Message cancelled."; break;
            
        case MessageComposeResultFailed:
            resultStringSms = @"Message failed."; break;
            
        case MessageComposeResultSent:
            resultStringSms = @"Message sent."; break;
            
        default:
            resultStringSms = @"Unknown result"; break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - MFMailComposeViewControllerDelegate methods
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    if (error) {
        //Something bad has ocurred
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
        [alert showError:self title:@"Hata"
                subTitle:@"Problem var."
        closeButtonTitle:@"OK" duration:0.0f];
    }
    
    NSString *resultStringEmail;
    switch (result) {
        case MFMailComposeResultSent:
            resultStringEmail = @"Sent mail"; break;
        case MFMailComposeResultSaved:
            resultStringEmail = @"Saved mail"; break;
        case MFMailComposeResultCancelled:
            resultStringEmail = @"Cancelled mail"; break;
        case MFMailComposeResultFailed:
            resultStringEmail = @"Mail failed"; break;
    }
    
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
