//
//  ViewController.m
//  MCIUImageCategories
//
//  Created by Baglan on 10/10/13.
//  Copyright (c) 2013 MobileCreators. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+croppedImageAtRect.h"
#import "UIImage+resizedImageWithSize.h"
#import "UIImage+colorAt.h"

@interface ViewController () {
    __weak IBOutlet UIImageView *_originalImageView;
    __weak IBOutlet UIImageView *_croppedImageView;
    __weak IBOutlet UIImageView *_scaledImageView;
    __weak IBOutlet UIView *_colorSampleView;
    __weak IBOutlet UILabel *_redLabel;
    __weak IBOutlet UILabel *_greenLabel;
    __weak IBOutlet UILabel *_blueLabel;
    __weak IBOutlet UILabel *_alphaLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _croppedImageView.image = [_originalImageView.image croppedImageAtRect:CGRectMake(60, 0, 200, 200)];
    _scaledImageView.image = [_croppedImageView.image resizedImageWithSize:CGSizeMake(50, 50)];
    _colorSampleView.backgroundColor = [_scaledImageView.image colorAt:CGPointMake(10, 10)];
    
    CGFloat red, green, blue, alpha;
    [_scaledImageView.image getRed:&red green:&green blue:&blue alpha:&alpha at:CGPointMake(10, 10)];
    
    _redLabel.text = [NSString stringWithFormat:@"%d", (NSUInteger)(red * 255)];
    _greenLabel.text = [NSString stringWithFormat:@"%d", (NSUInteger)(green * 255)];
    _blueLabel.text = [NSString stringWithFormat:@"%d", (NSUInteger)(blue * 255)];
    _alphaLabel.text = [NSString stringWithFormat:@"%d", (NSUInteger)(alpha * 255)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
