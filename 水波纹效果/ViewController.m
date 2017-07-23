//
//  ViewController.m
//  水波纹效果
//
//  Created by 曾浩 on 2017/7/23.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "RippleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"水波纹效果";
    
    [self setupView];
}

- (void)setupView
{
    RippleView *rippleView = [[RippleView alloc] initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 240)];
    [self.view addSubview:rippleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
