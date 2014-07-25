//
//  UIImage+IconWithTitle.m
//  MovieSeen
//
//  Created by Sam Miller on 7/24/14.
//  Copyright (c) 2014 MovieSeenApp. All rights reserved.
//

#import "UIImage+IconWithTitle.h"

@implementation UIImage (IconWithTitle)

+ (id) imageFromImage:(UIImage*)image string:(NSString*)string color:(UIColor*)color
{
  UIFont *font = [UIFont systemFontOfSize:16.0];
  CGSize expectedTextSize = [string sizeWithAttributes:@{NSFontAttributeName: font}];
  int width = expectedTextSize.width + image.size.width + 5;
  int height = MAX(expectedTextSize.height, image.size.height);
  CGSize size = CGSizeMake((float)width, (float)height);
  UIGraphicsBeginImageContextWithOptions(size, NO, 0);
  CGContextRef context = UIGraphicsGetCurrentContext();
  int fontTopPosition = (height - expectedTextSize.height) / 2;
  CGPoint textPoint = CGPointMake(image.size.width + 5, fontTopPosition);
  
  CGContextSaveGState(context);
  [color set];
  [string drawAtPoint:textPoint withAttributes:@{NSFontAttributeName: font,
                                                 NSForegroundColorAttributeName: color
                                                 }];
  // Images upside down so flip them
  CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, size.height);
  CGContextConcatCTM(context, flipVertical);
  CGContextDrawImage(context, (CGRect){ {0, (height - image.size.height) / 2}, {image.size.width, image.size.height} }, [image CGImage]);
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  CGContextRestoreGState(context);
  UIGraphicsEndImageContext();
  return newImage;
}

+ (UIImage *)imageFromImage:(UIImage *)image text:(NSString *)text textColor:(UIColor *)color textFont:(UIFont *)font spacing:(CGFloat)spacing {
  CGSize expectedTextSize = [text sizeWithAttributes:@{NSFontAttributeName:font}];
  CGFloat width = MAX(expectedTextSize.width, image.size.width);
  CGFloat height = image.size.height + spacing + expectedTextSize.height;
  CGSize size = CGSizeMake(width, height);
  
  CGPoint imageOrigin = CGPointMake((size.width - image.size.width) / 2.0, 0);
  CGPoint textOrigin = CGPointMake((size.width - expectedTextSize.width) / 2.0, image.size.height + spacing);
  
  UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  [text drawAtPoint:textOrigin withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color}];
  
  CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, size.height);
  CGContextConcatCTM(context, flipVertical);
  CGContextDrawImage(context, CGRectMake(imageOrigin.x, size.height - image.size.height, image.size.width, image.size.height), image.CGImage);
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

@end