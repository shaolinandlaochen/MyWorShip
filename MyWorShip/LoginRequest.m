//
//  LoginRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest
+(void)TheLoginRequestPhone:(NSString *)phone code:(NSString *)code block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:phone forKey:@"phone"];
    [dic setObject:code forKey:@"validateCode"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"phonelogin" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"登录:%@",dic);
        block(dic);
        
    }];
}

+(void)TheCode:(NSString *)phone block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:phone forKey:@"phone"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"sendphonelogin" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"获取验证码:%@",dic);
        block(dic);
        
    }];
}
@end
