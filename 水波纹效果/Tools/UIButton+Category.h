//
//  UIButton+Category.h
//  ShengXianSearch
//
//  Created by 曾浩 on 2017/1/17.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

/**
 创建一个button

 @param imageName 图片名称
 @return UIButton
 */
+ (UIButton *)creatButtonWithImageName:(NSString *)imageName;

/**
 创建一个button

 @param imageName 图片名称
 @param title 文字
 @param titleColor 字体颜色
 @param fontSize 字体大小
 @return UIButton
 */
+ (UIButton *)creatButtonWithImageName:(NSString *)imageName
                                 title:(NSString *)title
                            titleColor:(UIColor *)titleColor
                              fontSize:(CGFloat)fontSize;

/**
 创建一个button

 @param title 文字
 @param backgroundColor 背景颜色
 @param titleColor 字体颜色
 @param fontSize 字体大小
 @return UIButton
 */
+ (UIButton *)creatButtonWithTitle:(NSString *)title
                   backgroundColor:(UIColor *)backgroundColor
                        titleColor:(UIColor *)titleColor
                          fontSize:(CGFloat)fontSize;


@end
