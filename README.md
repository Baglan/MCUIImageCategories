# MCUIImageCategories

Helpful UIImage categories

## Installation

Copy files from the *Classes* folder to your project.

## Usage

	#import "UIImage+croppedImageAtRect.h"
	#import "UIImage+resizedImageWithSize.h"
	#import "UIImage+colorAt.h"
	
	…
	
    // Crop an image
    _croppedImageView.image = [_originalImageView.image croppedImageAtRect:CGRectMake(60, 0, 200, 200)];
    
    // Resize an image
    _scaledImageView.image = [_croppedImageView.image resizedImageWithSize:CGSizeMake(50, 50)];
    
    // Extract an UIColor value at a point from an image
    _colorSampleView.backgroundColor = [_scaledImageView.image colorAt:CGPointMake(10, 10)];
    
    // Extract RGBA color values at a point from an image
    CGFloat red, green, blue, alpha;
    [_scaledImageView.image getRed:&red green:&green blue:&blue alpha:&alpha at:CGPointMake(10, 10)];

## License

All code and other assets in this project are vailable under the MIT license.