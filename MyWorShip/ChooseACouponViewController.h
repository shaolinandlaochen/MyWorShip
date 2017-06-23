//
//  ChooseACouponViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/6/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
@protocol ChooseACouponDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

// mark 选择优惠券
-(void)Choose_a_coupon:(NSInteger)index;


@end
@interface ChooseACouponViewController : MyClass
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)BaseClass *model;
@end
