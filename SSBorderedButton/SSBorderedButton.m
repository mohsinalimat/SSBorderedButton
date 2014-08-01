//
//  SSBorderedButton.m
//
//  Copyright (c) 2014 StyleShare (https://stylesha.re)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <UIImage+Additions/UIImage+Additions.h>

#import "SSBorderedButton.h"


static const CGFloat SSBorderedButtonDefaultBorderWidth = 2;
static const CGFloat SSBorderedButtonDefaultCornerRadius = 3;


@interface SSBorderedButton ()

@property (nonatomic, strong) NSMutableDictionary *backgroundColorForState;
@property (nonatomic, strong) NSMutableDictionary *borderColorForState;

@end


@implementation SSBorderedButton

- (id)init
{
    return [self initWithFrame:CGRectMake(0, 0, 73, 44)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColorForState = [NSMutableDictionary dictionary];
        self.borderColorForState = [NSMutableDictionary dictionary];
        
        _borderWidth = SSBorderedButtonDefaultBorderWidth;
        _cornerRadius = SSBorderedButtonDefaultCornerRadius;
        
        [self setTitleColor:self.tintColor forState:UIControlStateNormal];
        [self _updateBackgroundImageForState:UIControlStateNormal];
    }
    return self;
}


#pragma mark - Background Color

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    NSAssert(color != nil, @"Background color cannot be nil.");
    self.backgroundColorForState[@(state)] = color;
    [self _updateBackgroundImageForState:state];
}

- (UIColor *)backgroundColorForState:(UIControlState)state
{
    UIColor *backgroundColor = self.backgroundColorForState[@(state)];
    if (backgroundColor) {
        return backgroundColor;
    }
    
    switch (state) {
        case UIControlStateNormal:
            return [UIColor clearColor];
            
        case UIControlStateHighlighted:
            return [self.tintColor colorWithAlphaComponent:0.2];

        default:
            return self.tintColor;
    }
}


#pragma mark - Border Color

- (void)setBorderColor:(UIColor *)color forState:(UIControlState)state
{
    NSAssert(color != nil, @"Border color cannot be nil.");
    self.borderColorForState[@(state)] = color;
    [self _updateBackgroundImageForState:state];
}

- (UIColor *)borderColorForState:(UIControlState)state
{
    UIColor *borderColor = self.borderColorForState[@(state)];
    if (borderColor) {
        return borderColor;
    }
    return self.tintColor;
}


#pragma mark - Privates

- (void)_updateBackgroundImageForState:(UIControlState)state
{
    UIColor *backgroundColor = [self backgroundColorForState:state];
    UIColor *borderColor = [self borderColorForState:state];
    NSDictionary *borderAttributes = @{NSStrokeColorAttributeName: borderColor,
                                       NSStrokeWidthAttributeName: @(self.borderWidth)};
    UIImage *backgroundImage = [UIImage resizableImageWithColor:backgroundColor
                                               borderAttributes:borderAttributes
                                                   cornerRadius:self.cornerRadius];
    [self setBackgroundImage:backgroundImage forState:state];
}

@end
