//
//  BWCircularShadowView.h
//  Boaw2
//
//  Created by Sam Miller on 6/20/14.
//  Copyright (c) 2014 Originate Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWEllipticalFadeView : UIView

@property (nonatomic,strong) NSArray *colors;
@property (assign,nonatomic) CGFloat solidEllipseWidth;

- (id)initWithFrame:(CGRect)frame colors:(NSArray *)colors solidEllipseWidth:(CGFloat)width;

@end
