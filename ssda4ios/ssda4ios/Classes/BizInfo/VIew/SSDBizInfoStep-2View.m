//
//  SSDBizInfoStep-2View.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoStep-2View.h"

@implementation SSDBizInfoStep_2View

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

#pragma mark --界面初始化
-(void)setUpUI
{
    //进度图片
    UIImageView * stepImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"step-2"]];
    [self addSubview:stepImageView];
    [stepImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.top).offset(H(20));
        make.size.equalTo(CGSizeMake(313, 6));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:W(14) text:@"选择商户类型"];
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stepImageView.bottom).offset(H(15));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    
    
    //美食餐饮
    BizInfoButton * foodButton = [BizInfoButton buttonWithType:UIButtonTypeCustom];
    [foodButton setImage:[UIImage imageNamed:@"food"] forState:UIControlStateNormal];
    foodButton.selected = YES;
    [foodButton setTitle:@"美食餐饮" forState:UIControlStateNormal];
    [foodButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    [foodButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    foodButton.titleLabel.font = [UIFont systemFontOfSize:W(14)];
    [self addSubview:foodButton];
    [foodButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(128), H(128)));
        make.left.equalTo(self.left).offset(W(16));
        make.top.equalTo(titleLable.bottom).offset(H(4));
    }];
//
    //生鲜
    BizInfoButton * FreshButton = [BizInfoButton buttonWithType:UIButtonTypeCustom];
    FreshButton.selected = YES;
    [FreshButton setImage:[UIImage imageNamed:@"vagetable"] forState:UIControlStateNormal];
    [FreshButton setTitle:@"生鲜" forState:UIControlStateNormal];
    [FreshButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    
    [FreshButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    FreshButton.titleLabel.font = [UIFont systemFontOfSize:W(14)];
    
    [self addSubview:FreshButton];
    [FreshButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(128), H(128)));
        make.right.equalTo(self.right).offset(W(-16));
        make.top.equalTo(titleLable.bottom).offset(H(4));
    }];
    
    
    //超市商品
    BizInfoButton * marketButton = [[BizInfoButton alloc]init];
    [marketButton setImage:[UIImage imageNamed:@"supermarket"] forState:UIControlStateNormal];
    marketButton.selected = YES;
    [marketButton setTitle:@"超市商品" forState:UIControlStateNormal];
    [marketButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    
    [marketButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    marketButton.titleLabel.font = [UIFont systemFontOfSize:W(14)];
    
    [self addSubview:marketButton];
    [marketButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(128), H(128)));
        make.left.equalTo(self.left).offset(W(16));
        make.top.equalTo(foodButton.bottom).offset(H(4));
    }];
    
    
    //蛋糕甜点
//    BizInfoButton * cakeButton = [[BizInfoButton alloc]init];
//    [cakeButton setImage:[UIImage imageNamed:@"cake"] forState:UIControlStateNormal];
//    [cakeButton setTitle:@"蛋糕甜点" forState:UIControlStateNormal];
//    [cakeButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
//
//    [cakeButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
//    cakeButton.titleLabel.font = [UIFont systemFontOfSize:w(14)];
//
//    [self addSubview:cakeButton];
//    [marketButton makeConstraints:^(MASConstraintMaker *make) {
//        make.size.equalTo(CGSizeMake(W(128), H(128)));
//        make.right.equalTo(self.right).offset(W(-32));
////        make.top.equalTo(foodButton.bottom).offset(H(4));
//        make.centerY.equalTo(marketButton);
//    }];

//
    //鲜花
    BizInfoButton * FlowerButton = [[BizInfoButton alloc]init];
    FlowerButton.selected = YES;
    [FlowerButton setImage:[UIImage imageNamed:@"flower"] forState:UIControlStateNormal];
    [FlowerButton setTitle:@"鲜花" forState:UIControlStateNormal];
    [FlowerButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    
    [FlowerButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    FlowerButton.titleLabel.font = [UIFont systemFontOfSize:W(14)];
    
    [self addSubview:FlowerButton];
    [FlowerButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(128), H(128)));
        make.left.equalTo(self.left).offset(W(16));
        make.top.equalTo(marketButton.bottom).offset(H(4));
    }];
    
    //其他
    BizinfoOtherButton * otherButton = [[BizinfoOtherButton alloc]init];
    otherButton.selected = YES;
    [otherButton setImage:[UIImage imageNamed:@"top more"] forState:UIControlStateNormal];
    [otherButton setTitle:@"其他" forState:UIControlStateNormal];
    [otherButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    
    [otherButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    otherButton.titleLabel.font = [UIFont systemFontOfSize:W(14)];
    otherButton.imageEdgeInsets = UIEdgeInsetsMake(21, 0, 0, 0);
    
    
    [self addSubview:otherButton];
    [otherButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(128), H(128)));
        make.right.equalTo(self.right).offset(W(-16));
        make.top.equalTo(FlowerButton.top);
    }];
//
   
    
    //底部按钮
    UIButton * nextStepSecond = [[UIButton alloc]init];
    [nextStepSecond setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [nextStepSecond setTitle:@"下一步" forState:UIControlStateNormal];
    nextStepSecond.titleLabel.font = [UIFont systemFontOfSize:18];
    
    [nextStepSecond addTarget:self action:@selector(nextstepSecond) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nextStepSecond];
    [nextStepSecond makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(60));
        
    }];
    
    

    
    
    
    
    
    
    
}

#pragma mark -- 下一步按钮点击
-(void)nextstepSecond
{
    XXJLog(@"22232323232")
    if ([self.delegate respondsToSelector:@selector(nextstepSecondClick)]) {
        [self.delegate nextstepSecondClick];
    }
}








@end
