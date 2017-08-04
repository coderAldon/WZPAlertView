//
//  ViewController.m
//  WZPAlertView
//
//  Created by 活来了 on 2017/7/26.
//  Copyright © 2017年 活来了. All rights reserved.
//

#import "ViewController.h"
#import "WZPAlertView.h"

@interface ViewController ()<WZPAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)inputAction:(id)sender {
    
    WZPAlertView *alertView = [[WZPAlertView alloc]initWithTitle:@"是否确认转账?" icon:[UIImage imageNamed:@""] message1:@"1.支付宝账号:5868396484@qq.com" message2:@"2.转账金额:10000元" delegate:self];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
