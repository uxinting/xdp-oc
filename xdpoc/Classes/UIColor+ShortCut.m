//
//  UIColor+ShortCut.m
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import "UIColor+ShortCut.h"

@implementation UIColor (ShortCut)

+ (UIColor *)fromString:(NSString *)colorStr {
    return [colorStr toColor];
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
