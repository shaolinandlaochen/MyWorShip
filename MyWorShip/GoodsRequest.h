//
//  GoodsRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsRequest : NSObject
/*
 *获取月拜商品
 */
+(void)GetOnGoods:(void(^)(NSDictionary *dic))bolck;
/*
 *获取商品详情
 */
+(void)GetProductDetails:(NSString *)c block:(void(^)(NSDictionary *dic))bolck;
/*
 *获取商品全部评价
 */
+(void)QueryEvaluationOfAllCommodities_serial:(NSString *)serial page:(NSString *)page pageSize:(NSString *)pageSize block:(void(^)(NSDictionary *dic))bolck;
@end
