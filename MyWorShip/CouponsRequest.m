//
//  CouponsRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import "CouponsRequest.h"

@implementation CouponsRequest
/*
 *获取优惠券列表
 */
+(void)ToObtainCouponsList_page:(NSInteger)page pageSize:(NSInteger)pageSize coupon_state:(NSInteger)coupon_state block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(pageSize) forKey:@"pageSize"];
    if (coupon_state==2) {
        coupon_state=-1;
    }
    [dic setObject:@(coupon_state) forKey:@"coupon_state"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycoupon" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取优惠券列表:%@",dic);
        block(dic);
        
    }];
}
@end
