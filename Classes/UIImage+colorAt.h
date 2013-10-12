//
//  UIImage+colorAt.h
//  MCIUImageCategories
//
//  Created by Baglan on 10/10/13.
//  Copyright (c) 2013 MobileCreators. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (colorAt)

- (void)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha at:(CGPoint)point;
- (UIColor *)colorAt:(CGPoint)point;

@end
