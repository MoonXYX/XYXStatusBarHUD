//
//  XYXStatusBarHUD.h
//  XYXStatusBarHUD
//
//  Created by XYX on 16/6/21.
//  Copyright © 2016年 XYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYXStatusBarHUD : NSObject

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image;
/**
 * 显示普通信息
 */
+ (void)showMessage:(NSString *)message;
/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)message;
/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)message;
/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)message;
/**
 * 隐藏
 */
+ (void)hide;

@end
