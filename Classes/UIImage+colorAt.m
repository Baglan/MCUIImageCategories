//
//  UIImage+colorAt.m
//  MCIUImageCategories
//
//  Created by Baglan on 10/10/13.
//  Copyright (c) 2013 MobileCreators. All rights reserved.
//

#import "UIImage+colorAt.h"

#define BYTES_PER_PIXEL     4
#define BITS_PER_COMPONENT  8

@implementation UIImage (colorAt)

- (void)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha at:(CGPoint)point
{
    unsigned char *dataBuffer = (unsigned char*) calloc(BYTES_PER_PIXEL, sizeof(unsigned char));
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(dataBuffer, 1, 1,
                                                 BITS_PER_COMPONENT, BYTES_PER_PIXEL, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], CGRectMake(point.x, point.y, 1, 1));
    CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), imageRef);
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    if (red) {
        *red   = (dataBuffer[0] * 1.0) / 255.0;
    }
    
    if (green) {
        *green = (dataBuffer[1] * 1.0) / 255.0;
    }
    
    if (blue) {
        *blue  = (dataBuffer[2] * 1.0) / 255.0;
    }
    
    if (alpha) {
        *alpha = (dataBuffer[3] * 1.0) / 255.0;
    }
    
    free(dataBuffer);
}

- (UIColor *)colorAt:(CGPoint)point
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    
    [self getRed:&red green:&green blue:&blue alpha:&alpha at:point];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
