//
//  RippleView.m
//  水波纹效果
//
//  Created by 曾浩 on 2017/7/23.
//  Copyright © 2017年 曾浩. All rights reserved.
//
#define COLOR_GREEN COLOR(98, 208, 131)

#define COLOR(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]


#import "RippleView.h"
#import "SDAutoLayout.h"
#import "UIButton+Category.h"

@interface RippleView()

@property (nonatomic, strong) UIButton *scanCodeBtn;

@end

@implementation RippleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setupView];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

#pragma mark -- 页面布局

- (void)setupView
{
    // 0. 扫码按钮
    [self sd_addSubviews:@[self.scanCodeBtn]];
    
    self.scanCodeBtn.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self, 54)
    .widthIs(80)
    .heightEqualToWidth();
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self beginRadarRippleAnimate];
    });
    
}

/**
 开始雷达波纹动效
 */
- (void)beginRadarRippleAnimate
{
    // 1. 第一圈波纹
    [self setupRadarRipple];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2. 第二圈波纹
        [self setupRadarRipple];
    });
}

/**
 设置雷达波纹动效
 */
- (void)setupRadarRipple
{
    CALayer * spreadLayer;
    spreadLayer = [CALayer layer];
    CGFloat diameter = 160;  //扩散的大小
    spreadLayer.bounds = CGRectMake(0,0, diameter, diameter);
    spreadLayer.cornerRadius = diameter/2; //设置圆角变为圆形
    spreadLayer.position = self.scanCodeBtn.center;
    spreadLayer.backgroundColor = COLOR_GREEN.CGColor;
    // 把扩散层放到头像按钮下面
    [self.layer insertSublayer:spreadLayer below:self.scanCodeBtn.layer];
    
    
    CAMediaTimingFunction * defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 2.5;//1.75
    animationGroup.repeatCount = INFINITY;//重复无限次
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = defaultCurve;
    
    //尺寸比例动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @0.5;//开始的大小
    scaleAnimation.toValue = @1.0;//最后的大小
    scaleAnimation.duration = 1.5;//动画持续时间
    
    //透明度动画
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 2.5;
    opacityAnimation.values = @[@1, @0.5,@0];//透明度值的设置
    //    opacityAnimation.values = @[@1, @0.67,@0.33];//透明度值的设置
    opacityAnimation.keyTimes = @[@0, @0.5,@1.0];//关键帧
    //    opacityAnimation.keyTimes = @[@0, @0.33,@0.67];//关键帧
    opacityAnimation.removedOnCompletion = NO;
    
    animationGroup.animations = @[scaleAnimation, opacityAnimation];//添加到动画组
    [spreadLayer addAnimation:animationGroup forKey:@"pulse"];
}

#pragma mark -- 内部方法

#pragma mark -- 懒加载

- (UIButton *)scanCodeBtn
{
    if (!_scanCodeBtn) {
        _scanCodeBtn = [UIButton creatButtonWithImageName:@"scan_saoma"];
        _scanCodeBtn.layer.cornerRadius = 80/2;
        _scanCodeBtn.backgroundColor = COLOR_GREEN;
        //[_scanCodeBtn addTarget:self action:@selector(scanCodeTraceAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanCodeBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
