//
//  MoneyRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MoneyRequest.h"

@implementation MoneyRequest
/*
 *钱包余额查询
 */
+(void)TheWalletBalanceQueryBlock:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycremain" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"钱包余额查询:%@",dic);
        block(dic);
        
    }];
}
/*
 *充值明细
 */
+(void)Top_upDetail_url:(NSString *)url Page:(NSString *)page pageSize:(NSString *)pageSize start:(NSString *)start end:(NSString *)end Block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:page forKey:@"page"];
    [dic setObject:pageSize forKey:@"pageSize"];
    [dic setObject:start forKey:@"start"];
    [dic setObject:end forKey:@"end"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:url Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"充值明细:%@",dic);
        block(dic);
        
    }];
}
@end
