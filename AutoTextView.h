//
//  AutoTextView.h
//  TipHesapla
//
//  Created by durul on 10.03.2013.
//  Copyright (c) 2013 durul dalkanat. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DAAutoTextViewNotificationStoped @"DAAutoTextViewNotificationStoped"

@interface AutoTextView : UITextView
{
    NSTimer *scrollTimer;
}

@property (nonatomic) CGFloat pointsPerSecond;
@property (nonatomic, getter = isScrolling) BOOL scrolling;
- (void)startScrolling;
- (void)stopScrolling: (BOOL) postNotification;
@end
