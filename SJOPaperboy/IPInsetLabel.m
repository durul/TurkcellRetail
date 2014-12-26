//
//  IPInsetLabel.m
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "IPInsetLabel.h"

@implementation IPInsetLabel
@synthesize insets;

- (void)drawTextInRect:(CGRect)rect 
{
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

- (void)resizeHeightToFitText
{
    CGRect frame = [self bounds];
    CGFloat textWidth = frame.size.width - (self.insets.left + self.insets.right);
    
    CGRect newSize = [self.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil];
    
    frame.size.height = newSize.size.height + self.insets.top + self.insets.bottom;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, frame.size.width, frame.size.height);
}

@end
