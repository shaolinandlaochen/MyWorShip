//
//  MyMessageRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyMessageRequest.h"

@implementation MyMessageRequest
+(void)TheMessageListpage:(NSInteger)page pageSize:(NSInteger)pageSize block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(pageSize) forKey:@"pageSize"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"message" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取消息列表:%@",dic);
        block(dic);
        
    }];
}
/*
 *设置消已读
 */
+(void)TheMessageDetailsmessage_id:(NSInteger)message_id block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(message_id) forKey:@"message_id"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"setmessageread" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取消息详情:%@",dic);
        block(dic);
        
    }];
}
/*
 *获取公告列表
 */
+(void)ToObtainAListAnnouncement_page:(NSInteger)page  pageSize:(NSInteger)pageSize block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(pageSize) forKey:@"pageSize"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"notice" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取公告列表:%@",dic);
        block(dic);
        
    }];
}
@end
