//
//  DeviceDetailViewController.m
//  turkcellretail2
//
//  Created by ddalkanat on 12/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "DeviceDetailViewController.h"

@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController
@synthesize device;
@synthesize devicePhoto;
@synthesize prepTimeLabel;
@synthesize ingredientTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
  
    //navigation bar custom back button without title
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //Navbar Image
    UIImage* image = [UIImage imageNamed:@"sahne_1.png"];
    CGRect frameimg = CGRectMake(0, 0, 15, 23);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=button;
    
    //Tableview Cell Configuration
    self.title = device.name;
    self.prepTimeLabel.text = device.prepTime;
    self.devicePhoto.image = [UIImage imageNamed:device.image];

    //Textview Scroll Configuration
    NSMutableString *ingredientText = [NSMutableString string];
    for (NSString* ingredient in device.ingredients) {
        [ingredientText appendFormat:@"%@\n", ingredient];
    }
    
    self.ingredientTextView.text = ingredientText;
    ingredientTextView.delegate = self;
    [ingredientTextView startScrolling];
    [ingredientTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [ingredientTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [ingredientTextView.layer setBorderWidth: 1.0];
    [ingredientTextView.layer setCornerRadius:8.0f];
    [ingredientTextView.layer setMasksToBounds:YES];
    
    //Imageview Configuration

    devicePhoto.layer.cornerRadius = 9.0;
    devicePhoto.layer.masksToBounds = YES;
    devicePhoto.layer.borderColor = [UIColor whiteColor].CGColor;
    devicePhoto.layer.borderWidth = 3.0;
    CGRect frame = devicePhoto.frame;
    frame.size.width = 100;
    frame.size.height = 100;
    devicePhoto.frame = frame;
    
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

@end
