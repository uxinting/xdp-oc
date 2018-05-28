//
//  XObjectRuntime.m
//  xdpoc_Example
//
//  Created by Wu,Xinting on 2018/5/28.
//  Copyright © 2018年 uxinting. All rights reserved.
//

#import "XObjectRuntime.h"
#import <xdpoc/xdpoc-umbrella.h>

@implementation XObjectRuntime

- (void)dealloc {
    NSLog(@"%@", [self propertyForKey:@"id"]);
}

@end
