//
//  SSDHomePublishVIew.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDHomePublishVIew.h"
#import "SSDHomePopupView.h"

@interface SSDHomePublishVIew ()<UITableViewDelegate,UITableViewDataSource>

//头像
@property (nonatomic, strong) UIImageView *iconView;

//底部的加号按钮
@property (nonatomic, strong) UIButton *addButton;

//我要发单按钮
@property (nonatomic, strong) UIButton *publishButton;

//有数据时显示的UITableView
@property (nonatomic, strong) UITableView * publishRootView;



@end

@implementation SSDHomePublishVIew

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //接面初始化
        [self setupUI];
        
        //增加点击事件
        [self addGestureClick];
    }
    return self;
}


#pragma mark -- 接面初始化
-(void)setupUI
{
    
    
//    self.publishRootView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0,0) style:UITableViewStylePlain];
//    self.publishRootView.backgroundColor = [UIColor whiteColor];
//    self.publishRootView.delegate = self;
//    self.publishRootView.dataSource = self;
//    self.publishRootView.alpha = 1;
//    [self addSubview:self.publishRootView];

    //主界面上的LOGO头像
    self.iconView = [[UIImageView alloc]init];
    self.iconView.layer.cornerRadius = W(43);
    self.iconView.clipsToBounds = YES;
    self.iconView.image = [UIImage imageNamed:@"logo"];
    self.iconView.layer.cornerRadius = 43;
    self.iconView.clipsToBounds = YES;
    [self addSubview:self.iconView];
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(150) - kMarginTopHeight);
        make.size.equalTo(CGSizeMake(W(86), H(86)));
        make.centerX.equalTo(self);
    }];
    
    //头像下面的标签
    UILabel * explainLableUp =  [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(16) text:@"点击左下角选择发单类型"];
    explainLableUp.textAlignment = NSTextAlignmentCenter;
    [self addSubview:explainLableUp];
    [explainLableUp makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.bottom).offset(H( 30));
        make.centerX.equalTo(self);
    }];
    
    UILabel * explianLableDown = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(16) text:@"随时达为您配送"];
    explianLableDown.textAlignment = NSTextAlignmentCenter;
    [self addSubview:explianLableDown];
    [explianLableDown makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(explainLableUp.bottom).offset(H(21));
        make.centerX.equalTo(self);
    }];
    
    
    //底部视图
    self.bottomView = [[UIView alloc]init];
    [self addSubview:self.bottomView];
    UIImageView * bottomImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"button"]];
    [self.bottomView insertSubview:bottomImage atIndex:0];
    [bottomImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self).offset(H(30));
        make.right.equalTo(self);
        make.height.equalTo(H(199));
    }];
    [self.bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self).offset(H(30));
        make.right.equalTo(self);
        make.height.equalTo(H(199));
    }];
    //底部视图上的➕按钮
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setImage:[UIImage imageNamed:@"choose"] forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.addButton];
    [self.addButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView).offset(W(41));
        make.bottom.equalTo(self.bottomView.bottom).offset(H(-24));
        make.size.equalTo(CGSizeMake(W(32), H(32)));
    }];
    //底部视图上的“我要发单”按钮
    self.publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.publishButton setTitle:@"我要发单" forState:UIControlStateNormal];
    [self.publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.publishButton];
    [self.publishButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomView).offset(W(50));
        make.bottom.equalTo(self.bottomView.bottom).offset(H(-24));
        make.size.equalTo(CGSizeMake(W(200), H(32)));
    }];
    
    
    //底部弹出视图
    self.popUpView = [[SSDHomePopupView alloc]init];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"botton menu-big"]];
    [self.popUpView insertSubview:imageView atIndex:0];
    
    [self.popUpView.takeoutBillButton addTarget:self action:@selector(takeoutClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.popUpView);
        make.bottom.equalTo(self.popUpView);
        make.right.equalTo(self.popUpView);
        make.height.equalTo(H(469));
    }];
    
//    [self addSubview:self.popUpView];
    [self.bottomView insertSubview:self.popUpView aboveSubview:bottomImage];
    [self.popUpView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.bottomView.bottom);
        make.size.equalTo(CGSizeMake(W(375), H(469)));
    }];
    
    
//    [self bringSubviewToFront:self.publishRootView];
    //将底部视图移动到最前面
    [self bringSubviewToFront:self.bottomView];
}

#pragma mark --
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"---------%ld",indexPath.row];
    return cell;
}


#pragma mark -- 我要发单 按钮点击事件
- (void)publishClick{
    //    self.rootView.alpha = 1;
    self.publishRootView.frame = CGRectMake(0, 0, WIDTH, HEIGHT - kMarginTopHeight);
}

#pragma mark -- ➕按钮点击事件
// 点击+号按钮
- (void)addClick{
    //    self.rootView.alpha = 0;
    self.publishRootView.frame = CGRectMake(0, 0, 0, 0);
    
    if ([self.delegate respondsToSelector:@selector(addButtonClick)]) {
        [self.delegate addButtonClick];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.popUpView.xxj_y = -H(469) +H(230);
    }];
}

#pragma mark -- 底部弹出视图里面的外卖录单点击
//外卖录单点击
-(void)takeoutClick
{
    if ([self.delegate respondsToSelector:@selector(takeoutClick)]) {
        [self.delegate takeoutClick];
    }
}

#pragma mark -- 增加点击事件
-(void)addGestureClick
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    
    [self addGestureRecognizer:tap];
}

#pragma mark -- 底部弹出视图退出
-(void)tapClick
{
    [UIView animateWithDuration:0.5 animations:^{
        self.popUpView.xxj_y = CGRectGetMaxY(self.popUpView.frame);
    }];

}

@end



















