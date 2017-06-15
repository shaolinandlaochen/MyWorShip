//
//  VIPRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 123. All rights reserved.
//

#import "VIPRequest.h"

@implementation VIPRequest
/*
 *获取VIP数据
 */
+(void)AccessToTheVIPData_page:(NSInteger)page pageSize:(NSInteger)pageSize block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(pageSize) forKey:@"pageSize"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"vipbaseinfocommall" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取VIP数据:%@",dic);
        block(dic);
        
    }];
}
/*
 *获取VIP消费记录明细
 */
+(void)AccessToTheVIPConsumptionRecordDetails_page:(NSInteger)page pageSize:(NSInteger)pageSize block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(pageSize) forKey:@"pageSize"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"queryvipbaseinfodetail" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取VIP消费记录明细:%@",dic);
        block(dic);
        
    }];
}
@end
