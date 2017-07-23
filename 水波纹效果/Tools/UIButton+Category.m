//
//  UIButton+Category.m
//  ShengXianSearch
//
//  Created by 曾浩 on 2017/1/17.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

+ (UIButton *)creatButtonWithImageName:(NSString *)imageName
{
    UIButton * button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    return button;
}

+ (UIButton *)creatButtonWithImageName:(NSString *)imageName
                                 title:(NSString *)title
                            titleColor:(UIColor *)titleColor
                              fontSize:(CGFloat)fontSize
{
    UIButton * button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    return button;
}


+ (UIButton *)creatButtonWithTitle:(NSString *)title
                   backgroundColor:(UIColor *)backgroundColor
                        titleColor:(UIColor *)titleColor
                          fontSize:(CGFloat)fontSize
{
    UIColor *backColor = [UIColor whiteColor];
    if (backgroundColor) backColor = backgroundColor;
    
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.backgroundColor = backColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    return button;
}

@end
