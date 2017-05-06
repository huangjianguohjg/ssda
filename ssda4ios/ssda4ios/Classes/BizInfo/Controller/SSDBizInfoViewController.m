//
//  SSDBizInfoViewController.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoViewController.h"
#import "SSDBizInfoVIew.h"
#import "SSDBizInfoStep-2ViewController.h"
@interface SSDBizInfoViewController ()<SSDBizInfoVIewDelegate>
@property(nonatomic,strong)SSDBizInfoVIew * bizInfoView;
@end

@implementation SSDBizInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"商家认证-填写基本信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back-black"] target:self action:@selector(backBtn)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    //界面初始化
    [self setUPUI];
}



#pragma mark -- 界面初始化
-(void)setUPUI
{
    self.bizInfoView = [[SSDBizInfoVIew alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    self.bizInfoView.delegate = self;
    [self.view addSubview:self.bizInfoView];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-white"] forBarMetrics:UIBarMetricsDefault];
    
    
    
}


#pragma mark -- 导航栏返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark -- 代理方法实现
-(void)nextStepClick
{
    XXJLog(@"xiayibu")
    SSDBizInfoStep_2ViewController * bizinfoStep2 = [[SSDBizInfoStep_2ViewController alloc]init];
    [self.navigationController pushViewController:bizinfoStep2 animated:YES];
    XXJLog(@"width===%f,height===%f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)
}

//待调试
-(void)tapGesClick
{
    [self.bizInfoView resignFirstResponder];
    
}
@end

















