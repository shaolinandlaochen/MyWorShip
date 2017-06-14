//
//  HomeRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/14.
//  Copyright © 2017年 123. All rights reserved.
//

#import "HomeRequest.h"

@implementation HomeRequest
/*
 *查找附近的设备
 */
+(void)TheDeviceNearTheQuery_equipment_longitude:(NSString *)equipment_longitude equipment_latitude:(NSString *)equipment_latitude block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:equipment_longitude forKey:@"equipment_longitude"];
    [dic setObject:equipment_latitude forKey:@"equipment_latitude"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"equipment" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"查找附近的设备:%@",dic);
        block(dic);
        
    }];
}
@end
