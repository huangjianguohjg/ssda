//
//  QuickBillView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PulldownView;
@class QuickBill;
@interface QuickBillView : UIView
//饿了吗账号视图
@property (nonatomic, strong) QuickBill * hungryAccountView;
//美团账号视图
//@property (nonatomic, strong) QuickBill * <#name#>;

//点击饿了吗 下拉菜单
@property (nonatomic, strong) PulldownView * hungryPull;
//点击美团。下拉菜单
@property (nonatomic, strong) PulldownView * meituanPull;


@end
