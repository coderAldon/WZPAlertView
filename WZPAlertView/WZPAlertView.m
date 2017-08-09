//
//  WZPAlertView.m
//  WZPAlertView
//
//  Created by 活来了 on 2017/7/26.
//  Copyright © 2017年 活来了. All rights reserved.
//

#import "WZPAlertView.h"
#import "Masonry.h"

#define kSuitLength(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

@interface WZPAlertView()

@property (strong, nonatomic)UIView *backgroundView;

@property (strong, nonatomic)UILabel *messageLabel1;

@property (strong, nonatomic)UILabel *messageLabel2;

@end

@implementation WZPAlertView

- (instancetype)init {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.backgroundColor = [UIColor clearColor];
        
        _backgroundView = [[UIView alloc] initWithFrame:self.frame];
        _backgroundView.backgroundColor = [UIColor blackColor];
        [self addSubview:_backgroundView];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon message1:(NSString *)message1 message2:(NSString *)message2 delegate:(id<WZPAlertViewDelegate>)delegate{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        _title = title;
        _icon = icon;
        _message1 = message1;
        _message2 = message2;
        _delegate = delegate;
        
        self.backgroundColor = [UIColor clearColor];
        
        _backgroundView = [[UIView alloc] initWithFrame:self.frame];
        _backgroundView.backgroundColor = [UIColor blackColor];
        [self addSubview:_backgroundView];
        [self initViews];
    }
    return self;
}

- (void)initViews{
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.layer.cornerRadius = kSuitLength(8);
    _contentView.layer.masksToBounds = YES;
    
    _contentView.frame = CGRectMake(0, 0, kSuitLength(275), kSuitLength(215));
    _contentView.center = self.center;
    [self addSubview:_contentView];
    
    UILabel *title = [UILabel new];
    [_contentView addSubview:title];
    
    title.text = _title;
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:kSuitLength(15)];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView.mas_top).offset(kSuitLength(12));
        make.centerX.equalTo(_contentView);
    }];
    
    UIImageView *iconMid = [UIImageView new];
    [_contentView addSubview:iconMid];
    iconMid.image = [UIImage imageNamed:@"ic_jiant"];
    
    [iconMid mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_contentView);
        make.top.equalTo(title.mas_bottom).offset(kSuitLength(25));
    }];
    
    UIImageView *iconLeft = [UIImageView new];
    [_contentView addSubview:iconLeft];
    iconLeft.image = [UIImage imageNamed:@"ic_yue"];
    
    [iconLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconMid);
        make.right.equalTo(iconMid.mas_left).offset(kSuitLength(-10));
        make.width.equalTo(@kSuitLength(36));
        make.height.equalTo(@kSuitLength(36));
    }];
    
    UIImageView *iconRight = [UIImageView new];
    [_contentView addSubview:iconRight];
    iconRight.image = [UIImage imageNamed:@"ic_alipay"];
    
    [iconRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconMid);
        make.left.equalTo(iconMid.mas_right).offset(kSuitLength(10));
        make.width.equalTo(@kSuitLength(36));
        make.height.equalTo(@kSuitLength(36));
    }];
    
    UILabel *message1 = [UILabel new];
    [_contentView addSubview:message1];
    
    message1.text = _message1;
    message1.textColor = [UIColor blackColor];
    message1.font = [UIFont systemFontOfSize:kSuitLength(12)];
    
    [message1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconLeft.mas_bottom).offset(kSuitLength(20));
        make.left.equalTo(_contentView.mas_left).offset(kSuitLength(10));
    }];
    
    UILabel *message2 = [UILabel new];
    [_contentView addSubview:message2];
    
    message2.text = _message2;
    message2.textColor = [UIColor blackColor];
    message2.font = [UIFont systemFontOfSize:kSuitLength(12)];
    
    [message2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(message1.mas_bottom).offset(kSuitLength(8));
        make.left.equalTo(_contentView.mas_left).offset(kSuitLength(10));
    }];
    
    UIView *line1 = [UIView new];
    [_contentView addSubview:line1];
    
    line1.backgroundColor = [UIColor lightGrayColor];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_contentView.mas_bottom).offset(kSuitLength(-60));
        make.left.equalTo(_contentView.mas_left).offset(kSuitLength(0));
        make.right.equalTo(_contentView.mas_right).offset(kSuitLength(0));
        make.height.equalTo(@0.5);
    }];
    
    UIView *line2 = [UIView new];
    [_contentView addSubview:line2];
    
    line2.backgroundColor = [UIColor lightGrayColor];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(kSuitLength(0));
        make.bottom.equalTo(_contentView.mas_bottom).offset(kSuitLength(0));
        make.centerX.equalTo(_contentView);
        make.width.equalTo(@0.5);
    }];
    
    UIView *cancleBtn = [UIView new];
    [_contentView addSubview:cancleBtn];
    
    cancleBtn.layer.cornerRadius = kSuitLength(8);
    cancleBtn.layer.masksToBounds = YES;
    cancleBtn.backgroundColor = [UIColor whiteColor];
    [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(kSuitLength(0));
        make.bottom.equalTo(_contentView.mas_bottom).offset(kSuitLength(0));
        make.left.equalTo(_contentView.mas_left).offset(kSuitLength(0));
        make.right.equalTo(line2.mas_left).offset(kSuitLength(0));
    }];
    
    UILabel *cancle = [UILabel new];
    [cancleBtn addSubview:cancle];
    
    cancle.text = @"取消";
    cancle.textColor = [UIColor lightGrayColor];
    cancle.font = [UIFont systemFontOfSize:kSuitLength(15)];
    
    [cancle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(cancleBtn);
        make.centerY.equalTo(cancleBtn);
    }];
    //触摸事件
    UITapGestureRecognizer *cancelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancel)];
    [cancleBtn addGestureRecognizer:cancelTap];
    
    UIView *confirmBtn = [UIView new];
    [_contentView addSubview:confirmBtn];
    
    confirmBtn.layer.cornerRadius = kSuitLength(8);
    confirmBtn.layer.masksToBounds = YES;
    confirmBtn.backgroundColor = [UIColor whiteColor];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(kSuitLength(0));
        make.bottom.equalTo(_contentView.mas_bottom).offset(kSuitLength(0));
        make.left.equalTo(line2.mas_right).offset(kSuitLength(0));
        make.right.equalTo(_contentView.mas_right).offset(kSuitLength(0));
    }];
    
    UILabel *confirm = [UILabel new];
    [confirmBtn addSubview:confirm];
    
    confirm.text = @"确认";
    confirm.textColor = [UIColor blueColor];
    confirm.font = [UIFont systemFontOfSize:kSuitLength(15)];
    
    [confirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(confirmBtn);
        make.centerY.equalTo(confirmBtn);
    }];
    //触摸事件
    UITapGestureRecognizer *confirmTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(confirm)];
    [confirmBtn addGestureRecognizer:confirmTap];
}

- (void)show{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    NSArray *windowViews = [window subviews];
    if(windowViews && [windowViews count] > 0){
        UIView *subView = [windowViews objectAtIndex:[windowViews count]-1];
        for(UIView *aSubView in subView.subviews)
        {
            [aSubView.layer removeAllAnimations];
        }
        [subView addSubview:self];
        [self showBackground];
        [self showAlertAnimation];
    }
}

- (void)hide{
    [self hideAlertAnimation];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        _contentView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)cancel{
    [self hide];
}

- (void)confirm{
    [self hide];
}

- (void)showBackground
{
    _backgroundView.alpha = 0;
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.35];
    _backgroundView.alpha = 0.6;
    [UIView commitAnimations];
}

-(void)showAlertAnimation
{
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.30;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [_contentView.layer addAnimation:animation forKey:nil];
}

- (void)hideAlertAnimation {
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.35];
    _backgroundView.alpha = 0.0;
    [UIView commitAnimations];
    
    
}

@end
