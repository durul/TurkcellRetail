//
//  SAHighlightedTextField.m
//  turkcellretail2
//
//  Created by ddalkanat on 27/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//
#import "SAHighlightedTextField.h"

#define kSAHighlightedTextFieldDefaultTextInsets CGSizeMake(0.0f,0.0f)
#define kSAHighlightedTextFieldDefaultTextOffset CGPointMake(0.0f,0.0f)

typedef NS_ENUM(NSInteger, SAHighlightedTextFieldState)
{
    kSAHighlightedTextFieldStateNormal,
    kSAHighlightedTextFieldStateHighlighted
};

@interface SAHighlightedTextField()

@property (assign, nonatomic) SAHighlightedTextFieldState curState;

@property (strong, nonatomic) UIImage *normalBackgroundImage;
@property (strong, nonatomic) UIImage *highlightedBackgroundImage;

@end

@implementation SAHighlightedTextField

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [self toggleState:kSAHighlightedTextFieldStateNormal];
    self.textInsets = kSAHighlightedTextFieldDefaultTextInsets;
    self.textOffset = kSAHighlightedTextFieldDefaultTextOffset;
}

#pragma mark - NSObject


#pragma mark - Public

- (void)configureWithBackgroundImage:(UIImage *)bgImage andHighlightedImage:(UIImage *)highlightedImage withResizeCapInsets:(UIEdgeInsets)insets
{
    self.borderStyle = UITextBorderStyleNone;
    self.normalBackgroundImage = [bgImage resizableImageWithCapInsets:insets];
    self.highlightedBackgroundImage = [highlightedImage resizableImageWithCapInsets:insets];

    [self updateView];
}

#pragma mark - Private

- (void)updateView
{
    [self toggleState:self.curState];
}

#pragma mark - ToggleState

- (void)toggleState:(SAHighlightedTextFieldState)toState
{
    switch (toState) {
        case kSAHighlightedTextFieldStateNormal:
            self.background = self.normalBackgroundImage;
            break;
        case kSAHighlightedTextFieldStateHighlighted:
            self.background = self.highlightedBackgroundImage;
            break;
        default:
            break;
    }
    self.curState = toState;
}

#pragma mark - Responder chain

- (BOOL)becomeFirstResponder
{
    BOOL result = [super becomeFirstResponder];
	
    if (result)
    {
        [self toggleState:kSAHighlightedTextFieldStateHighlighted];
    }
    return result;
}

- (BOOL)resignFirstResponder
{
    BOOL result = [super resignFirstResponder];
	
    if (result)
    {
        [self toggleState:kSAHighlightedTextFieldStateNormal];
    }
    return result;
}

#pragma mark - Insets

- (CGRect)generalInsetRectForBounds:(CGRect)bounds
{
    CGRect originalInsetRect = CGRectInset(bounds, self.textInsets.width, self.textInsets.height);
    CGRect offsetRect = CGRectOffset(originalInsetRect, self.textOffset.x, self.textOffset.y);
    CGRect finalRect = CGRectMake(offsetRect.origin.x, offsetRect.origin.y, offsetRect.size.width - self.textOffset.x, offsetRect.size.height);
    return finalRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return [self generalInsetRectForBounds:bounds];
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return [self generalInsetRectForBounds:bounds];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return [self generalInsetRectForBounds:bounds];
}


@end
