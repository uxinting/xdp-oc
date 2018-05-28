//
//  UIView+ShortCut.m
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import "UIView+ShortCut.h"

inline CGFloat CGRectLeft(CGRect rect) {
    return rect.origin.x;
}

inline CGFloat CGRectTop(CGRect rect) {
    return rect.origin.y;
}

inline CGFloat CGRectBottom(CGRect rect) {
    return rect.origin.y + CGRectHeight(rect);
}

inline CGFloat CGRectRight(CGRect rect) {
    return rect.origin.x + CGRectWidth(rect);
}

inline CGFloat CGRectWidth(CGRect rect) {
    return rect.size.width;
}

inline CGFloat CGRectHeight(CGRect rect) {
    return rect.size.height;
}

inline CGPoint CGRectCenter(CGRect rect) {
    return CGPointMake((CGRectLeft(rect) + CGRectWidth(rect)) / 2.f, (CGRectTop(rect) + CGRectHeight(rect)) / 2.f);
}

@implementation UIView (ShortCut)

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.origin.y;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.left + self.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.top + self.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.center.x;
}

- (void)setX:(CGFloat)x
{
    self.center = CGPointMake(x, self.center.y);
}

- (CGFloat)y
{
    return self.center.y;
}

- (void)setY:(CGFloat)y
{
    self.center = CGPointMake(self.center.x, y);
}

@end
