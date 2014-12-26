//
//  ViewController.m
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "ViewController.h"
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
#import <CoreLocation/CoreLocation.h>
#import "SJOPaperboyViewController.h"

@interface ViewController ()
{
    //Video Play
    MPMoviePlayerController *moviePlayer2;
    
    //Sound Play
    SystemSoundID soundEffect;
}

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

@end


@implementation ViewController
@synthesize backgroundImageView,logo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    logo.reflectionScale = 3.5f;
    logo.reflectionScale = 0.5f;
    logo.reflectionGap = 20.0f;
    logo.shadowOffset = CGSizeMake(0.0f, 4.0f);
    logo.shadowBlur = 5.0f;
    logo.cornerRadius = 10.0f;

    
    // This example application uses a four finger tap gesture to trigger the screenshot. You should use whatever gesture or mechanism works best with your app.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    tapGesture.numberOfTouchesRequired = 3;
    [self.view addGestureRecognizer:tapGesture];

    //navigation bar custom back button without title
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  
    
   /* UIImage* image = [UIImage imageNamed:@"turkcell_nav.png"];
    CGRect frameimg = CGRectMake(0, 0, 15, 23);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=button;
    */

    //Sound Play
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundURL), &soundEffect);
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)exit_app:(id)sender {
    

    //Close application
    exit(0);

}

- (IBAction)video:(id)sender {

    NSString * video = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp4"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:video];
    
    MPMoviePlayerViewController * player = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:player];
    player.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    player.moviePlayer.fullscreen = YES;
    player.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
    [self.view addSubview:player.view];

    
}

#pragma mark - Prediction

- (void) makePrediction {
    [self.backgroundImageView startAnimating];
    //self.predictionLabel.text = [self.crystalBall randomPrediction];
    AudioServicesPlaySystemSound(soundEffect);
    
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

#pragma mark - Testing
- (NSString *)reverseString:(NSString *)stringToReverse
{
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[stringToReverse length]];
    
    [stringToReverse enumerateSubstringsInRange:NSMakeRange(0,[stringToReverse length])
                                        options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                                     usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                         [reversedString appendString:substring];
                                     }];
    return reversedString;
}

- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *result))completion
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2.0f];
        dispatch_sync(dispatch_get_main_queue(), ^{
            completion(@"result");
        });
    });
}

#pragma mark - Tap Gesture
- (void)tapGestureRecognized:(UITapGestureRecognizer *)tapGesture
{
    SJOPaperboyViewController *viewController = [[SJOPaperboyViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];

}

//Check if User Touched Anything in Your iOS App
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSLog(@"touch at %@", NSStringFromCGPoint([touch locationInView:touch.view]));
    return NO;
}

@end
