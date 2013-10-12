//
//  UIImage+resizedImageWithSize.m
//  MCIUImageCategories
//
//  Created by Baglan on 10/10/13.
//  Copyright (c) 2013 MobileCreators. All rights reserved.
//

#import "UIImage+resizedImageWithSize.h"

@implementation UIImage (resizedImageWithSize)

- (UIImage *)resizedImageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

@end
