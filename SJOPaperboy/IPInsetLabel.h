//
//  IPInsetLabel.h
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IPInsetLabel : UILabel
@property (nonatomic, assign) UIEdgeInsets insets;
- (void)resizeHeightToFitText;
@end
