//
//  SSDHomeViewController.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDHomeViewController.h"
#import "SSDHomePublishVIew.h"
#import "SSDBizInfoViewController.h"
#import "SSDSideslipView.h"//侧滑视图
#import "SSDSideslipAboutMeViewController.h"//侧滑视图点击弹出界面  关于我
#import "SSDStoreApproveViewController.h"//侧滑视图点击弹出界面  商户认证
#import "SSDReportViewController.h"//侧滑视图点击弹出界面  投诉举报
#import "SSDSideslipSettingViewController.h"//侧滑视图点击弹出界面  设置
@interface SSDHomeViewController ()<SSDHomePublishVIewDelegate,SSDSideslipViewDelegate>

@property(nonatomic,strong)SSDHomePublishVIew * publishView;

@property(strong,nonatomic) SSDSideslipView * sideslipView;

@property(strong,nonatomic) UIView * coverView;
@end

@implementation SSDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏下面的黑线隐藏
    [self setNavLine];
    
    //界面初始化
    [self setUpUI];
    
    //设置背景图片
    [self setUpBackImage];
    
    //设置导航栏设置导航栏左右按钮图片
    [self setUpNavItem];
    
    //设置覆盖层
    [self setUpCoverLayer];
    
    //设置侧滑视图
    [self setUpSideslip];
    
    
}
#pragma mark -- 设置覆盖层
-(void)setUpCoverLayer
{
    self.coverView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.coverView.backgroundColor = [UIColor whiteColor];
    self.coverView.alpha = 0;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.coverView addGestureRecognizer:tap];
    [[UIApplication sharedApplication].keyWindow addSubview:self.coverView];
}

#pragma mark -- 覆盖层手势点击
-(void)tapClick
{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.sideslipView.xxj_x = -self.sideslipView.xxj_width;
        self.coverView.alpha = 0;
    }];
    
}

#pragma mark -- 设置侧滑视图
-(void)setUpSideslip
{
    self.sideslipView = [[SSDSideslipView alloc]init];
    self.sideslipView.delegate = self;
//    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu-BG"]];
//    [self.sideslipView insertSubview:imageView atIndex:0];
    
    if (WIDTH == 414) { //6P
        self.sideslipView.frame = CGRectMake(-339, 0, 339, HEIGHT );
    }else if (WIDTH == 375){ // 6
        self.sideslipView.frame = CGRectMake(-307, 0, 307, HEIGHT);
    }else if (WIDTH == 320){ // 5
        self.sideslipView.frame = CGRectMake(-262, 0, 262, HEIGHT );
    }
    
    
    
    

    [[UIApplication sharedApplication].keyWindow addSubview:self.sideslipView];
}

#pragma mark -- 设置导航栏左右按钮图片
-(void)setUpNavItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"menu"] target:self action:@selector(leftBarClick)];
    
    UIBarButtonItem * rightSearch = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"search"] target:self action:@selector(searchClick)];
    
    UIBarButtonItem * rightNoti = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"notification"] target:self action:@selector(notiClick)];
    
    self.navigationItem.rightBarButtonItems = @[rightNoti,rightSearch];
}

#pragma mark -- 导航栏左边按钮点击事件
-(void)leftBarClick
{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.sideslipView.xxj_x = 0;
        self.coverView.alpha = 0.7;
    }];
    
}

-(void)searchClick
{
    
}

-(void)notiClick
{
    
}


#pragma mark --设置导航栏下面的黑线隐藏
-(void)setNavLine
{
    //设置导航栏下面的黑线隐藏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.publishView = [[SSDHomePublishVIew alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - H(80))];
    self.publishView.delegate = self;
    [self.view addSubview:self.publishView];
    
}


#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.publishView insertSubview:backImageView atIndex:0];
    
    
}


#pragma mark --SSDHomePublishVIewDelegate地步弹出视图代理方法
-(void)addButtonClick
{
    XXJLog(@"点击了+号")
}
-(void)takeoutClick
{
    XXJLog(@"点击啊了外卖")
    SSDBizInfoViewController * biz = [[SSDBizInfoViewController alloc]init];
    [self.navigationController pushViewController:biz animated:YES];
}

#pragma mark -- 代理方法SSDSideslipViewDelegate
#pragma mark -- 侧滑界面 顶部更多按钮点击
-(void)moreBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDSideslipAboutMeViewController * aboutMeVc = [[SSDSideslipAboutMeViewController alloc]init];
    [self.navigationController pushViewController:aboutMeVc animated:YES];
}

#pragma mark -- 侧滑界面 商家认证 点击
-(void)storeApproveBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDStoreApproveViewController * apporveVc = [[SSDStoreApproveViewController alloc]init];
    [self.navigationController pushViewController:apporveVc animated:YES];
}


#pragma mark -- 侧滑界面 投诉举报 点击
-(void)reportBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDReportViewController * reportVc = [[SSDReportViewController alloc]init];
    [self.navigationController pushViewController:reportVc animated:YES];
}

#pragma mark -- 侧滑界面 设置 点击
-(void)settingBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDSideslipSettingViewController * setVc = [[SSDSideslipSettingViewController alloc]init];
    [self.navigationController pushViewController:setVc animated:YES];
    
}


#pragma mark --侧滑退出  覆盖层消失
-(void)sideNeed
{
    //侧滑退出
    //覆盖层消失
    [UIView animateWithDuration:0.5 animations:^{
        self.sideslipView.xxj_x = -self.sideslipView.xxj_width-500;
        self.coverView.alpha = 0;
    }];
}

#pragma mark -- 视图将要显示的时候，设置导航栏背景图片和侧滑视图的位置
-(void)viewWillAppear:(BOOL)animated
{
    self.sideslipView.xxj_x = -self.sideslipView.xxj_width-50;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-blue"] forBarMetrics:UIBarMetricsDefault];
}















@end
