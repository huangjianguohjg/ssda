//
//  SSDBizInfoStep-3View.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoStep-3View.h"

@implementation SSDBizInfoStep_3View
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    //进度图片
    UIImageView * stepImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"step-3"]];
    [self addSubview:stepImageView];
    [stepImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.top).offset(H(20));
        make.size.equalTo(CGSizeMake(W(313), H(6)));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:W(14) text:@"上传身份照片"];
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stepImageView.bottom).offset(H(15));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //
    UILabel * attentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(9) text:@"请保证身份证文字清晰可见"];
    [self addSubview:attentionLable];
    [attentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(titleLable.bottom);
        make.left.equalTo(titleLable.right).offset(W(15));
    }];
    
    //参考正面照片ImageView
    UIImageView * referencefrontPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"small grey area"]];
    [self addSubview:referencefrontPhoto];
    [referencefrontPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLable.bottom).offset(H(12));
//        make.left.equalTo(self).offset(W(32));
        make.right.equalTo(self.centerX).offset(W(-12));
        make.size.equalTo(CGSizeMake(144, 110));
    }];
    
    //参考正面照片标签
    UILabel * referencefrontLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(9) text:@"参考正面照片"];
    [referencefrontPhoto addSubview:referencefrontLable];
    [referencefrontLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(referencefrontPhoto.bottom).offset(-10);
        make.centerX.equalTo(referencefrontPhoto);
    }];
    
    //点击上传身份证正面照片ImageView
    UIImageView * frontPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"small grey area"]];
    [self addSubview:frontPhoto];
    [frontPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLable.bottom).offset(H(12));
//        make.right.equalTo(self).offset(W(-32));
        make.left.equalTo(self.centerX).offset(W(12));
        make.size.equalTo(CGSizeMake(144, 110));
    }];
    
    
    //点击上传身份证正面照片标签
    UILabel * frontLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(12) text:@"点击上传\n身份证正面照片"];
    frontLable.textAlignment = NSTextAlignmentCenter;
    frontLable.numberOfLines = 0;
    [frontPhoto addSubview:frontLable];
    [frontLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(frontPhoto);
        make.centerY.equalTo(frontPhoto);
    }];
    
    
    
    //参考反面照片ImageView
    UIImageView * referencebackPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"small grey area"]];
    [self addSubview:referencebackPhoto];
    [referencebackPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(referencefrontPhoto.bottom).offset(H(11));
        //        make.left.equalTo(self).offset(W(32));
        make.right.equalTo(self.centerX).offset(W(-12));
        make.size.equalTo(CGSizeMake(144, 110));
    }];
    //参考反面照片标签
    UILabel * referencebackLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(9) text:@"参考反面照片"];
    [referencebackPhoto addSubview:referencebackLable];
    [referencebackLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(referencebackPhoto.bottom).offset(-10);
        make.centerX.equalTo(referencebackPhoto);
    }];

    //
    UIImageView * backPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"small grey area"]];
    [self addSubview:backPhoto];
    [backPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(frontPhoto.bottom).offset(H(11));
        //        make.right.equalTo(self).offset(W(-32));
        make.left.equalTo(self.centerX).offset(W(12));
        make.size.equalTo(CGSizeMake(144, 110));
    }];
    
    
    UILabel * backLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(12) text:@"点击上传\n身份证反面照片"];
    backLable.textAlignment = NSTextAlignmentCenter;
    backLable.numberOfLines = 0;
    [backPhoto addSubview:backLable];
    [backLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backPhoto);
        make.centerY.equalTo(backPhoto);
    }];
    
    
    //上传手持身份照片Lable
    UILabel * middleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:W(14) text:@"上传手持身份照片"];
    [self addSubview:middleLable];
    [middleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backPhoto.bottom).offset(H(39));
        make.left.equalTo(self.left).offset(W(32));
    }];
    
    //请保证身份证正面文字清晰可见Lable
    UILabel * middleattentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(9) text:@"请保证身份证正面文字清晰可见"];
    [self addSubview:middleattentionLable];
    [middleattentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(middleLable.bottom);
        make.left.equalTo(middleLable.right).offset(W(15));
    }];
    
    //点击上传手持身份证正面照片ImageView
    UIImageView * handIDPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"big grey area"]];
    [self addSubview:handIDPhoto];
    [handIDPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleLable.bottom).offset(H(12));
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(311, 200));
    }];
    
    //点击上传手持身份证正面照片Lable
    UILabel * handIDLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(12) text:@"点击上传\n手持身份证正面照片"];
    handIDLable.textAlignment = NSTextAlignmentCenter;
    handIDLable.numberOfLines = 0;
    [handIDPhoto addSubview:handIDLable];
    [handIDLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(handIDPhoto);
        make.centerY.equalTo(handIDPhoto);
    }];
    
    //上传店主与店铺合照Lable
    UILabel * bottomLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:W(14) text:@"上传店主与店铺合照"];
    [self addSubview:bottomLable];
    [bottomLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(handIDPhoto.bottom).offset(H(39));
        make.left.equalTo(self.left).offset(W(32));
    }];
    
    //请保证店铺门头清晰完整Lable
    UILabel * bottomattentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(9) text:@"请保证店铺门头清晰完整"];
    [self addSubview:bottomattentionLable];
    [bottomattentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bottomLable.bottom);
        make.left.equalTo(bottomLable.right).offset(W(15));
    }];
    
    
    //点击上传店铺与店主合照ImageView
    self.storePhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"big grey area"]];
    [self addSubview:self.storePhoto];
    [self.storePhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomLable.bottom).offset(H(12));
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(311, 200));
    }];
    
    //点击上传店铺与店主合照Lable
    UILabel * storeLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(12) text:@"点击上传\n店铺与店主合照"];
    storeLable.textAlignment = NSTextAlignmentCenter;
    storeLable.numberOfLines = 0;
    [self.storePhoto addSubview:storeLable];
    [storeLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.storePhoto);
        make.centerY.equalTo(self.storePhoto);
        
    }];
    
    
}























@end
