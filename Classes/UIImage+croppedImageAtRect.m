//
//  UIImage+croppedImageAtRect.m
//  MCIUImageCategories
//
//  Created by Baglan on 10/10/13.
//  Copyright (c) 2013 MobileCreators. All rights reserved.
//

#import "UIImage+croppedImageAtRect.h"

@implementation UIImage (croppedImageAtRect)

- (UIImage *)croppedImageAtRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

@end
