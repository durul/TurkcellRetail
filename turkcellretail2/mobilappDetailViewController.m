//
//  mobilappDetailViewController.m
//  turkcellretail2
//
//  Created by ddalkanat on 12/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "mobilappDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface mobilappDetailViewController ()

@end

@implementation mobilappDetailViewController
@synthesize Mobilapp,recipePhoto;
@synthesize ingredientTextView;
@synthesize nameLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    //navigation bar custom back button without title
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //Navbar Image
    UIImage* image = [UIImage imageNamed:@"sahne_5.png"];
    CGRect frameimg = CGRectMake(0, 0, 40, 41);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=button;
    
    /*
    recipePhoto.layer.backgroundColor=[[UIColor clearColor] CGColor];
    recipePhoto.layer.cornerRadius=20;
    recipePhoto.layer.borderWidth=8.0;
    recipePhoto.layer.masksToBounds = YES;
    recipePhoto.layer.borderColor=[[UIColor whiteColor] CGColor];
     */
    
    
    //Tableview Cell Configuration
    self.title = Mobilapp.name;
    self.nameLabel.text = Mobilapp.name;
    self.recipePhoto.image = [UIImage imageNamed:Mobilapp.imagedetail];
    
    //Textview Scroll Configuration
    NSMutableString *ingredientText = [NSMutableString string];
    for (NSString* ingredient in Mobilapp.ingredients) {
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
    
    
    recipePhoto.layer.cornerRadius = 9.0;
    recipePhoto.layer.masksToBounds = YES;
    recipePhoto.layer.borderColor = [UIColor whiteColor].CGColor;
    recipePhoto.layer.borderWidth = 3.0;
    CGRect frame = recipePhoto.frame;
    frame.size.width = 100;
    frame.size.height = 100;
    recipePhoto.frame = frame;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
