//
//  SSDBizInfoStep-2View.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSDBizInfoStep_2ViewDelegate <NSObject>
//下一步按钮点击
-(void)nextstepSecondClick;

@end
@interface SSDBizInfoStep_2View : UIView

@property(weak,nonatomic) id<SSDBizInfoStep_2ViewDelegate> delegate;
@end
