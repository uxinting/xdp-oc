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
//#import <ChameleonFramework/Chameleon.h>

@interface XViewController ()

@property (nonatomic, strong) NSMutableArray<NSString *> * arr;

@end

@implementation XViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor gradientWithStyle:UIGradientStyleRadial inFrame:self.view.bounds byColors:@[[UIColor redColor], [UIColor blueColor]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
