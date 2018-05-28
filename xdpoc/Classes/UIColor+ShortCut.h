//
//  UIColor+ShortCut.h
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIGradientStyle)
{
    UIGradientStyleLeftToRight,
    UIGradientStyleRadial,
    UIGradientStyleTopToBottom
};

@interface UIColor (ShortCut)

+ (UIColor *)random;

+ (UIColor *)gradientWithStyle:(UIGradientStyle)style inFrame:(CGRect)frame byColors:(NSArray<UIColor *> *)colors;

/**
 Get Color From String.
 eg:
 0xFF0000FF --- red color with alpha 1.0
 0xFF000000 --- red color with alpha 0.0 (transparent)

 @param colorStr color string
 @return color from this string
 */
+ (UIColor *)fromString:(NSString *)colorStr;

- (UIColor *)lighten:(CGFloat)percentage;
- (UIColor *)darken:(CGFloat)percentage;

@end


@interface NSString (Color)

/**
 Make Color by this String.
 eg:
 0xFF0000FF --- red color with alpha 1.0
 0xFF000000 --- red color with alpha 0.0 (transparent)

 @return Color
 */
- (UIColor *)toColor;

@end
