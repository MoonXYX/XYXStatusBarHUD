//
//  XYXStatusBarHUD.m
//  XYXStatusBarHUD
//
//  Created by XYX on 16/6/21.
//  Copyright © 2016年 XYX. All rights reserved.
//

#import "XYXStatusBarHUD.h"

#define XYXMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const XMGMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const XYXAnimationDuration = 0.25;

@implementation XYXStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/**
 * 显示窗口
 */
+ (void)showWindow
{
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor colorWithRed:1.0 green:200 / 255.0 blue:100 / 255.0 alpha:1.0];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:XYXAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 * 显示普通信息
 * @param message       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:message forState:UIControlStateNormal];
    button.titleLabel.font = XYXMessageFont;
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 * 显示普通信息
 */
+ (void)showMessage:(NSString *)message
{
    [self showMessage:message image:nil];
}

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)message
{
    [self showMessage:message image:[UIImage imageNamed:@"XYXStatusBarHUD.bundle/success"]];
}

/**
 * 显示错误信息
 */
+ (void)showError:(NSString *)message
{
    [self showMessage:message image:[UIImage imageNamed:@"XYXStatusBarHUD.bundle/error"]];
}

/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)message
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = XYXMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = message;
    label.textColor = [UIColor blackColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat messageW = [message sizeWithAttributes:@{NSFontAttributeName : XYXMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - messageW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

/**
 * 隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:XYXAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
        timer_ = nil;
    }];
}


@end
