//
//  WZPAlertView.h
//  WZPAlertView
//
//  Created by 活来了 on 2017/7/26.
//  Copyright © 2017年 活来了. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WZPAlertViewDelegate;

@interface WZPAlertView : UIView

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImage *icon;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *message1;
@property (strong, nonatomic) NSString *message2;

@property (weak, nonatomic) id<WZPAlertViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon message1:(NSString *)message1 message2:(NSString *)message2 delegate:(id<WZPAlertViewDelegate>)delegate;

- (void)show;

- (void)hide;

@end


@protocol WZPAlertViewDelegate <NSObject>

- (void)cancel;

- (void)confirm;

@end
