//
//  CouponsRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CouponsRequest : NSObject
/*
 *获取优惠券列表
 */
+(void)ToObtainCouponsList_page:(NSInteger)page pageSize:(NSInteger)pageSize coupon_state:(NSInteger)coupon_state block:(void(^)(NSDictionary *dic))block;
@end
