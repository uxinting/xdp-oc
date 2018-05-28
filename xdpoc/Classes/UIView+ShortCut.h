//
//  UIView+ShortCut.h
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import <UIKit/UIKit.h>

@interface UIView (ShortCut)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@end

inline CGFloat CGRectLeft(CGRect rect);
inline CGFloat CGRectTop(CGRect rect);
inline CGFloat CGRectBottom(CGRect rect);
inline CGFloat CGRectRight(CGRect rect);
inline CGFloat CGRectWidth(CGRect rect);
inline CGFloat CGRectHeight(CGRect rect);

inline CGPoint CGRectCenter(CGRect rect);
