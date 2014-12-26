//
//  TodayViewController.m
//  TurkcellRetail
//
//  Created by ddalkanat on 23/12/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

// Macro for NSUserDefaults key
#define RATE_KEY @"kUDRateUsed"

#define kWClosedHeight   37.0
#define kWExpandedHeight 106.0


@interface TodayViewController () <NCWidgetProviding>


@end

@implementation TodayViewController
@synthesize detailsLabel,percentLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateInterface];
    // new
    [self setPreferredContentSize:CGSizeMake(0.0, kWClosedHeight)];
    [self.detailsLabel setAlpha:0.0];

}

-(void)viewWillTransitionToSize:(CGSize)size
      withTransitionCoordinator:
(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:
     ^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         [self.detailsLabel setAlpha:1.0];
     } completion:nil];
}

-(void)updateDetailsLabel
{
    NSByteCountFormatter *formatter =
    [[NSByteCountFormatter alloc] init];
    [formatter setCountStyle:NSByteCountFormatterCountStyleFile];
    

    self.detailsLabel.text = [NSString stringWithFormat:@"Used:\t%@", [formatter stringFromByteCount:self.usedSize]];
                              
    self.percentLabel.text = [NSString stringWithFormat:@"nFree:\t%@", [formatter stringFromByteCount:self.freeSize]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSizes
{
    // Retrieve the attributes from NSFileManager
    NSDictionary *dict = [[NSFileManager defaultManager]
                          attributesOfFileSystemForPath:NSHomeDirectory()
                          error:nil];
    
    // Set the values
    self.fileSystemSize = [[dict valueForKey:NSFileSystemSize]
                           unsignedLongLongValue];
    self.freeSize       = [[dict valueForKey:NSFileSystemFreeSize]
                           unsignedLongLongValue];
    self.usedSize       = self.fileSystemSize - self.freeSize;
}

// @implementation
- (double)usedRate
{
    return [[[NSUserDefaults standardUserDefaults]
             valueForKey:RATE_KEY] doubleValue];
}

- (void)setUsedRate:(double)usedRate
{
    NSUserDefaults *defaults =
    [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSNumber numberWithDouble:usedRate]
                forKey:RATE_KEY];
    [defaults synchronize];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler
{
    
    [self updateSizes];
    
    double newRate = (double)self.usedSize / (double)self.fileSystemSize;
    
    if (newRate - self.usedRate < 0.0001) {
        completionHandler(NCUpdateResultNoData);
    } else {
        [self setUsedRate:newRate];
        [self updateInterface];
        completionHandler(NCUpdateResultNewData);
    }
}

- (void)updateInterface
{
    double rate = self.usedRate; // retrieve the cached value
    self.percentLabel.text = [NSString stringWithFormat:@"%.1f%%", (rate * 100)];
}

@end
