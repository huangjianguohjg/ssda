//
//  SSDHomePublishVIew.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SSDHomePopupView;

@protocol SSDHomePublishVIewDelegate <NSObject>

-(void)addButtonClick;
-(void)takeoutClick;

@end
@interface SSDHomePublishVIew : UIView

@property(strong,nonatomic) SSDHomePopupView * popUpView;

@property(strong,nonatomic) UIView *bottomView;  

@property(weak,nonatomic) id<SSDHomePublishVIewDelegate> delegate;
@end
