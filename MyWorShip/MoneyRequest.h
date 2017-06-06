//
//  MoneyRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoneyRequest : NSObject
/*
 *钱包余额查询
 */
+(void)TheWalletBalanceQueryBlock:(void(^)(NSDictionary *dic))block;
/*
 *充值明细和消费明细
 */
+(void)Top_upDetail_url:(NSString *)url Page:(NSString *)page pageSize:(NSString *)pageSize start:(NSString *)start end:(NSString *)end Block:(void(^)(NSDictionary *dic))block;
@end
