//
//  AutoTextView.m
//  TipHesapla
//
//  Created by durul on 10.03.2013.
//  Copyright (c) 2013 durul dalkanat. All rights reserved.
//

#import "AutoTextView.h"

@implementation AutoTextView
@synthesize pointsPerSecond;
@synthesize scrolling;


- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    if(newWindow) {
        [self.panGestureRecognizer addTarget:self action:@selector(gestureDidChange:)];
        [self.pinchGestureRecognizer addTarget:self action:@selector(gestureDidChange:)];
    }
    else {
        [self stopScrolling: YES];
        [self.panGestureRecognizer removeTarget:self action:@selector(gestureDidChange:)];
        [self.pinchGestureRecognizer removeTarget:self action:@selector(gestureDidChange:)];
    }
}

#pragma mark - Touch methods

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view {
    [self stopScrolling: YES];
    return [super touchesShouldBegin:touches withEvent:event inContentView:view];
}

- (void)gestureDidChange:(UIGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            if([self isScrolling]){
                [self stopScrolling: YES];
            }
            break;
        }
        default:
            break;
    }
}

- (BOOL)becomeFirstResponder {
    [self stopScrolling: YES];
    return [super becomeFirstResponder];
}

#pragma mark - Property methods

- (CGFloat)pointsPerSecond {
    if (!pointsPerSecond)
    {
        pointsPerSecond = 15.0f;
    }
    return pointsPerSecond;
}

#pragma mark - Public methods

- (void)startScrolling {
    [self stopScrolling: NO];
    self.scrolling = YES;
    CGFloat animationDuration = (0.5f / self.pointsPerSecond);
    scrollTimer = [NSTimer scheduledTimerWithTimeInterval:animationDuration
                                                    target:self
                                                  selector:@selector(updateScroll)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (void)stopScrolling: (BOOL) postNotification {
    if(postNotification)
        [[NSNotificationCenter defaultCenter] postNotificationName:DAAutoTextViewNotificationStoped
                                                            object:nil];
    [scrollTimer invalidate];
    scrollTimer = nil;
    self.scrolling = NO;
}

- (void)updateScroll {
    CGFloat animationDuration = scrollTimer.timeInterval;
    CGFloat pointChange = self.pointsPerSecond * animationDuration;
    CGPoint newOffset = self.contentOffset;
    newOffset.y = newOffset.y + pointChange;
    
    if (newOffset.y > (self.contentSize.height - self.bounds.size.height)) {
        [self stopScrolling: YES];
    }
    else {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationDuration];
        self.contentOffset = newOffset;
        [UIView commitAnimations];
    }
}


@end
