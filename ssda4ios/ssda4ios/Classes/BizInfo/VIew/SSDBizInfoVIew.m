//
//  SSDBizInfoVIew.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoVIew.h"
#import "InfoTexdFieldView.h"

@interface SSDBizInfoVIew ()

@end
@implementation SSDBizInfoVIew

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //界面初始化
        [self setUpUI];
        //
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

-(void)tapClick
{
    if ([self.delegate respondsToSelector:@selector(tapGesClick)]) {
        [self.delegate tapGesClick];
    }
    
    
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    //进度图片
    UIImageView * stepImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"step-1"]];
    [self addSubview:stepImageView];
    [stepImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.top).offset(H(20));
        make.size.equalTo(CGSizeMake(W(313), H(6)));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //提示标签
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:W(14) text:@"填写店主本人信息"];
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stepImageView.bottom).offset(H(28));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //
    
    //真实姓名
    InfoTexdFieldView * nameTextField = [[InfoTexdFieldView alloc]init];
    nameTextField.headLable.text = @"真实姓名";
    nameTextField.contentField.placeholder = @"请输入真实姓名";
    
    [self addSubview:nameTextField];
    [nameTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(titleLable.bottom).offset(H(10));
        make.height.equalTo(H(45));
    }];

    
    //身份证号
    InfoTexdFieldView * idTextField = [[InfoTexdFieldView alloc]init];
    idTextField.headLable.text = @"身份证号";
    idTextField.contentField.placeholder = @"请输入身份证号";
    [self addSubview:idTextField];
    [idTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(nameTextField.bottom);
        make.height.equalTo(H(45));
    }];
    
    //商户名称
    InfoTexdFieldView * merchantTextField = [[InfoTexdFieldView alloc]init];
    merchantTextField.headLable.text = @"商户名称";
    merchantTextField.contentField.placeholder = @"请输入商户名称";
    [self addSubview:merchantTextField];
    [merchantTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(idTextField.bottom);
        make.height.equalTo(H(45));
    }];
    
    //联系方式
    InfoTexdFieldView * contactTextField = [[InfoTexdFieldView alloc]init];
    contactTextField.headLable.text = @"联系方式";
    contactTextField.contentField.placeholder = @"请输入联系方式";
    [self addSubview:contactTextField];
    [contactTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(merchantTextField.bottom);
        make.height.equalTo(H(45));
    }];
    
    //切换座机按钮
    UIButton * changeButton = [[UIButton alloc]init];
    [changeButton setTitle:@"切换座机" forState:UIControlStateNormal];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    changeButton.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:changeButton];
    [changeButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-26));
        make.top.equalTo(contactTextField.headLable.top);
        
        
    }];
    
    //所在地址
    InfoTexdFieldView * addressTextField = [[InfoTexdFieldView alloc]init];
    addressTextField.headLable.text = @"所在地址";
    addressTextField.contentField.placeholder = @"请输入所在地址";
    [self addSubview:addressTextField];
    [addressTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(contactTextField.bottom);
        make.height.equalTo(H(45));
    }];
    
    //标记位置
    InfoTexdFieldView * locationTextField = [[InfoTexdFieldView alloc]init];
    locationTextField.headLable.text = @"标记位置";
    locationTextField.contentField.placeholder = @"请输入标记位置";
    [self addSubview:locationTextField];
    [locationTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(addressTextField.bottom);
        make.height.equalTo(H(45));
    }];
    
    //更多按钮
    UIButton * locationmoreBtn = [[UIButton alloc]init];
    [locationmoreBtn setBackgroundImage:[UIImage imageNamed:@"forward black"] forState:UIControlStateNormal];
    [self addSubview:locationmoreBtn];
    [locationmoreBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(locationTextField);
        make.right.equalTo(self.right).offset(-W(26));

    }];
    
    //推广BD
    InfoTexdFieldView * adTextField = [[InfoTexdFieldView alloc]init];
    adTextField.headLable.text = @"推广BD   ";
    adTextField.contentField.placeholder = @"选填";
    [self addSubview:adTextField];
    [adTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(locationTextField.bottom);
        make.height.equalTo(H(45));
    }];
    
    //更多按钮
    UIButton * admoreBtn = [[UIButton alloc]init];
    [admoreBtn setBackgroundImage:[UIImage imageNamed:@"forward black"] forState:UIControlStateNormal];
    [self addSubview:admoreBtn];
    [admoreBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(adTextField);
        make.right.equalTo(self.right).offset(-W(26));
        
    }];
    
  
    UILabel *attentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] textFont:W(9) text:@"请使用本人身份信息进行验证，以确保能够正常体现"];
    [self addSubview:attentionLable];
    [attentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(adTextField.bottom).offset(H(29));
        make.left.equalTo(adTextField.left);
    }];
    
    
    //底部按钮
    UIButton * nextStepBtn = [[UIButton alloc]init];
    [nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextStepBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    [nextStepBtn setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [self addSubview:nextStepBtn];
    
    [nextStepBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(60));
    }];
    
}


#pragma mark -- 按钮下一步  点击事件
-(void)nextStep
{
    if ([self.delegate respondsToSelector:@selector(nextStepClick)]) {
        [self.delegate nextStepClick];
    }
}

@end
