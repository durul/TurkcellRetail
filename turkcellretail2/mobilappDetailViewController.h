//
//  mobilappDetailViewController.h
//  turkcellretail2
//
//  Created by ddalkanat on 12/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mobilapp.h"
#import "AutoTextView.h"

@interface mobilappDetailViewController : UIViewController
<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *recipePhoto;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet AutoTextView *ingredientTextView;

@property (nonatomic, strong) mobilapp *Mobilapp;

@end
