//
//  GoodsRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import "GoodsRequest.h"

@implementation GoodsRequest
/*
 *获取月拜商品
 */
+(void)GetOnGoods_page:(int)page pageSize:(int)pageSize block:(void(^)(NSDictionary *dic))bolck{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(pageSize) forKey:@"pageSize"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"commodityall" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取月拜商品:%@",dic);
        bolck(dic);
        
    }];
}
/*
 *获取商品详情
 */
+(void)GetProductDetails:(NSString *)c block:(void(^)(NSDictionary *dic))bolck{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:c forKey:@"c"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycommdetail" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取商品详情:%@",dic);
        bolck(dic);
        
    }];
}
/*
 *获取商品全部评价
 */
+(void)QueryEvaluationOfAllCommodities_serial:(NSString *)serial page:(NSString *)page pageSize:(NSString *)pageSize block:(void(^)(NSDictionary *dic))bolck{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:serial forKey:@"serial"];
    [dic setObject:page forKey:@"page"];
    [dic setObject:pageSize forKey:@"pageSize"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycomment" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取商品全部评价:%@",dic);
        bolck(dic);
        
    }];
}
@end
