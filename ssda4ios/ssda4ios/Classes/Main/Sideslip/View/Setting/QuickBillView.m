//
//  QuickBillView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置-> 一键发单设置===================================

#import "QuickBillView.h"
#import "QuickBill.h"
#import "PulldownView.h"
@implementation QuickBillView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];

    }
    return self;
}


#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.hungryAccountView = [[QuickBill alloc]init];
    self.hungryAccountView.titleLable.text = @"绑定饿了吗商家账号";
    UITapGestureRecognizer * hungryTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hungryTapClick)];
    [self.hungryAccountView addGestureRecognizer:hungryTap];
    [self addSubview:self.hungryAccountView];
    [self.hungryAccountView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(55));
    }];
    
    
    self.hungryPull = [[PulldownView alloc]init];
    self.hungryPull.titleLable.text = @"请输入您在饿了吗平台的商家账号和密码";
    [self addSubview:self.hungryPull];
//    [self insertSubview:self.hungryPull belowSubview:self.hungryAccountView];
    [self.hungryPull makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hungryAccountView.bottom).offset(-H(self.hungryPull.xxj_height));
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(300));
    }];
    
}

//饿了吗账号点击
-(void)hungryTapClick
{
    self.hungryAccountView.spreadButton.selected = !self.hungryAccountView.spreadButton.selected;
    
    if (self.hungryAccountView.spreadButton.selected == YES) {
        [UIView animateWithDuration:3 animations:^{
            self.hungryPull.xxj_y = CGRectGetMaxY(self.hungryAccountView.frame);
//            self.hungryPull.xxj_height = 300;
        }];
    }
    else
    {
        [UIView animateWithDuration:3 animations:^{
            self.hungryPull.xxj_height = 0;
            self.hungryPull.xxj_y = -300;
        }];
    }
    
    
    
    
    
    
    
    
}

@end
