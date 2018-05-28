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
    self.view.backgroundColor = [@"0xFFFF00FF" toColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
