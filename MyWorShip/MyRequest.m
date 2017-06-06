//
//  MyRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyRequest.h"

@implementation MyRequest
/*
 *获取基本信息
 */
+(void)AccessToEssentialInformationBLOCK:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querybaseinfo" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取基本信息:%@",dic);
        block(dic);
        
    }];
}
@end
