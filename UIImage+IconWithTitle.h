//
//  UIImage+IconWithTitle.h
//  MovieSeen
//
//  Created by Sam Miller on 7/24/14.
//  Copyright (c) 2014 MovieSeenApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IconWithTitle)

+ (id) imageFromImage:(UIImage*)image string:(NSString*)string color:(UIColor*)color;
+ (UIImage *)imageFromImage:(UIImage *)image text:(NSString *)text textColor:(UIColor *)color textFont:(UIFont *)font spacing:(CGFloat)spacing;

@end