//
//  ShipmentRequests.m
//  MyWorShip
//
//  Created by 123 on 2017/6/16.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ShipmentRequests.h"

@implementation ShipmentRequests
/*
 *评价
 */
+(void)evaluation_comment_content:(NSString *)comment_content comment_grade:(NSInteger)comment_grade commodity_serial:(NSString *)commodity_serial order_serial:(NSString *)order_serial block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:comment_content forKey:@"comment_content"];
    [dic setObject:@(comment_grade) forKey:@"comment_grade"];
    [dic setObject:commodity_serial forKey:@"commodity_serial"];
    [dic setObject:order_serial forKey:@"order_serial"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"ordercomment" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"评价:%@",dic);
        block(dic);
        
    }];
}
@end
