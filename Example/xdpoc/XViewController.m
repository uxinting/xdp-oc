//
//  XViewController.m
//  xdpoc
//
//  Created by uxinting on 05/28/2018.
//  Copyright (c) 2018 uxinting. All rights reserved.
//

#import "XViewController.h"
#import "XObjectRuntime.h"
#import <xdpoc/xdpoc-umbrella.h>

@interface XViewController ()

@property (nonatomic, strong) NSMutableArray<NSString *> * arr;

@end

@implementation XViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arr = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [self.arr safeAddObject:@"0"];
    }
	
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSUInteger index = self.arr.count - 1;
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"%@", [self.arr safeObjectAtIndex:index]);
//            sleep(1);
//        }
//    });
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self.arr removeObjectAtIndex:0];
//    });
//    XObjectRuntime * or = [[XObjectRuntime alloc] init];
//    XObjectRuntime * or2 = [[XObjectRuntime alloc] init];
//    [or addProperty:@"xinting" forKey:@"id"];
//
//    [or2 addProperty:@"xinting2" forKey:@"id"];
//    [or addProperty:or2 forKey:@"or2"];
    NSString * text = @"吴新庭wuxinting";
    NSString * key = @"ddd";
    NSLog(@"%@", [text MD5]);
    NSLog(@"%@", [text SHA1]);
    NSString * encrypt = [text AES256Encrypt:key];
    NSData *data = [[text dataUsingEncoding:NSUTF8StringEncoding] AES256Encrypt:key];
    NSLog(@"%@", [text AES256Encrypt:key]);
    NSLog(@"%@", [encrypt AES256Decrypt:key]);
    NSData * deData = [data AES256Decrypt:key];
    NSString *decry = [[NSString alloc] initWithData:deData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", decry);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
