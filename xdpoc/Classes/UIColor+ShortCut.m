//
//  UIColor+ShortCut.m
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import "UIColor+ShortCut.h"

@implementation UIColor (ShortCut)

+ (UIColor *)random {
#define R ((float)arc4random_uniform(255)) / 255.f
    return [UIColor colorWithRed:R green:R blue:R alpha:1.0];
}

+ (UIColor *)fromString:(NSString *)colorStr {
    return [colorStr toColor];
}

+ (UIColor *)gradientWithStyle:(UIGradientStyle)style inFrame:(CGRect)frame byColors:(NSArray<UIColor *> *)colors {
    //Create our background gradient layer
    CAGradientLayer *backgroundGradientLayer = [CAGradientLayer layer];
    
    //Set the frame to our object's bounds
    backgroundGradientLayer.frame = frame;
    
    //To simplfy formatting, we'll iterate through our colors array and create a mutable array with their CG counterparts
    NSMutableArray *cgColors = [[NSMutableArray alloc] init];
    for (UIColor *color in colors) {
        [cgColors addObject:(id)[color CGColor]];
    }
    
    switch (style) {
        case UIGradientStyleLeftToRight: {
            
            //Set out gradient's colors
            backgroundGradientLayer.colors = cgColors;
            
            //Specify the direction our gradient will take
            [backgroundGradientLayer setStartPoint:CGPointMake(0.0, 0.5)];
            [backgroundGradientLayer setEndPoint:CGPointMake(1.0, 0.5)];
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size,NO, [UIScreen mainScreen].scale);
            [backgroundGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
            
        case UIGradientStyleRadial: {
            UIGraphicsBeginImageContextWithOptions(frame.size,NO, [UIScreen mainScreen].scale);
            
            //Specific the spread of the gradient (For now this gradient only takes 2 locations)
            CGFloat locations[2] = {0.0, 1.0};
            
            //Default to the RGB Colorspace
            CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
            CFArrayRef arrayRef = (__bridge CFArrayRef)cgColors;
            
            //Create our Fradient
            CGGradientRef myGradient = CGGradientCreateWithColors(myColorspace, arrayRef, locations);
            
            
            // Normalise the 0-1 ranged inputs to the width of the image
            CGPoint myCentrePoint = CGPointMake(0.5 * frame.size.width, 0.5 * frame.size.height);
            float myRadius = MIN(frame.size.width, frame.size.height) * 1.0;
            
            // Draw our Gradient
            CGContextDrawRadialGradient (UIGraphicsGetCurrentContext(), myGradient, myCentrePoint,
                                         0, myCentrePoint, myRadius,
                                         kCGGradientDrawsAfterEndLocation);
            
            // Grab it as an Image
            UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            
            // Clean up
            CGColorSpaceRelease(myColorspace); // Necessary?
            CGGradientRelease(myGradient); // Necessary?
            UIGraphicsEndImageContext();
            
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
            
        case UIGradientStyleTopToBottom:
        default: {
            
            //Set out gradient's colors
            backgroundGradientLayer.colors = cgColors;
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size,NO, [UIScreen mainScreen].scale);
            [backgroundGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
            
    }
}

- (UIColor *)lighten:(CGFloat)percentage {
    //Define HSBA values
    CGFloat h, s, b, a;
    
    //Check if HSBA values exist
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        
        //Make sure our percentage is greater than 0
        if (percentage > 0) {
            b = MIN(b + percentage, 1.0);
        }
        
        //Return lighter color
        return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
    }
    
    return nil;
}

- (UIColor *)darken:(CGFloat)percentage {
    //Define HSBA values
    CGFloat h, s, b, a;
    
    //Check if HSBA values exist
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        
        //Make sure our percentage is greater than 0
        if (percentage > 0) {
            b = MIN(b - percentage, 1.0);
        }
        
        //Return darker color
        return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
    }
    
    return nil;
}

@end


@implementation NSString (Color)

- (UIColor *)toColor {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    unsigned hex;
    if (![scanner scanHexInt:&hex]) return nil;
    
    int r = (hex >> 24) & 0xFF;
    int g = (hex >> 16) & 0xFF;
    int b = (hex >> 8) & 0xFF;
    int a = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a / 255.f];
}

@end
