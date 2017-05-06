//
//  SSDBizInfoVIew.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SSDBizInfoVIewDelegate <NSObject>

-(void)nextStepClick;
-(void)tapGesClick;
@end
@interface SSDBizInfoVIew : UIView

@property(weak,nonatomic) id<SSDBizInfoVIewDelegate> delegate;
@end
