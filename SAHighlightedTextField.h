//
//  SAHighlightedTextField.h
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAHighlightedTextField : UITextField

- (void)configureWithBackgroundImage:(UIImage *)bgImage andHighlightedImage:(UIImage *)highlightedImage withResizeCapInsets:(UIEdgeInsets)insets;

@property (assign, nonatomic) CGSize textInsets;
@property (assign, nonatomic) CGPoint textOffset;

@end
