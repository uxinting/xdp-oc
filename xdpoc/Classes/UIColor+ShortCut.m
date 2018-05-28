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
