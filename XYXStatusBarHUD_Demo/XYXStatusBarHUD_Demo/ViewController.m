//
//  ViewController.m
//  XYXStatusBarHUD_Demo
//
//  Created by XYX on 16/6/21.
//  Copyright © 2016年 XYX. All rights reserved.
//

#import "ViewController.h"
#import "XYXStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {
    
    [XYXStatusBarHUD showSuccess:@"加载成功!"];
    
}
- (IBAction)error:(id)sender {
    
    [XYXStatusBarHUD showError:@"加载失败!"];
    
}
- (IBAction)loading:(id)sender {
    
    [XYXStatusBarHUD showLoading:@"正在加载..."];
    
}
- (IBAction)hide:(id)sender {
    
    [XYXStatusBarHUD hide];
    
}
- (IBAction)message:(id)sender {
    
    [XYXStatusBarHUD showMessage:@"可自定义图片显示" image:[UIImage imageNamed:@"warning"]];
    
}


@end
