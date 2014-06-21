//
//  BWCircularShadowView.m
//  Boaw2
//
//  Created by Sam Miller on 6/20/14.
//  Copyright (c) 2014 Originate Inc. All rights reserved.
//

#import "BWEllipticalFadeView.h"

@implementation BWEllipticalFadeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _solidEllipseWidth = 0;
        _colors = @[(id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4].CGColor,(id)[UIColor clearColor].CGColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame colors:(NSArray *)colors solidEllipseWidth:(CGFloat)width {
    self = [self initWithFrame:frame];
    if (self) {
        if ([colors count] > 0) {
            _colors = colors;
        }
        _solidEllipseWidth = width;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGFloat maxDimension = MAX(self.bounds.size.width,self.bounds.size.height);
    CGFloat widthScale = self.bounds.size.width/maxDimension;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextScaleCTM(context, widthScale, self.bounds.size.height/maxDimension);
    
    CGPathRef path = CGPathCreateWithEllipseInRect(CGRectMake(0, 0, maxDimension, maxDimension), NULL);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGPathRelease(path);
    
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient =  CGGradientCreateWithColors(space, (CFArrayRef)self.colors,NULL);
    CGPoint circleCenter = CGPointMake(maxDimension/2.0, maxDimension/2.0);
    CGContextDrawRadialGradient(context,
                                gradient,
                                circleCenter,
                                widthScale * self.solidEllipseWidth/2.0,
                                circleCenter, maxDimension/2.0,
                                kCGGradientDrawsBeforeStartLocation);
    
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(space);
    
    CGContextRestoreGState(context);
}



@end
