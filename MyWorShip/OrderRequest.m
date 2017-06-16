//
//  OrderRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/16.
//  Copyright © 2017年 123. All rights reserved.
//

#import "OrderRequest.h"

@implementation OrderRequest
/*
 *获取订单列表
 */
+(void)ToObtainAListOrder_page:(NSInteger)page pageSize:(NSInteger)pageSize type:(NSString *)type block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(pageSize) forKey:@"pageSize"];
    if (type==nil) {
        [dic setObject:@"all" forKey:@"type"];
    }else{
    [dic setObject:type forKey:@"type"];
    }
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"order" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取订单列表:%@",dic);
        block(dic);
        
    }];
}
@end
