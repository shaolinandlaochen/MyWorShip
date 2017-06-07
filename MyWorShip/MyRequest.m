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
/*
 *修改昵称
 */
+(void)NicknameChange_base_is_nickname:(NSString *)base_is_nickname BLOCK:(void(^)(NSDictionary *dic))block{

    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:base_is_nickname forKey:@"base_nickname"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"setnickname" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"修改昵称:%@",dic);
        block(dic);
        
    }];
}
/*
 *设置性别
 */
+(void)setSex_base_sex:(NSInteger)base_sex BLOCK:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@(base_sex) forKey:@"base_sex"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"setsex" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"设置性别:%@",dic);
        block(dic);
        
    }];
}
/*
 *设置生理期的时间
 */
+(void)PhysiologicalPeriodOfTime:(NSString *)base_period_date BLOCK:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:base_period_date forKey:@"base_period_date"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"setperioddate" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"设置生理期的时间:%@",dic);
        block(dic);
        
    }];
}
/*
 *发送旧手机验证码
 */
+(void)SendTheOldPhoneVerificationCodeBLOCK:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"sendoldphone" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"发送旧手机验证码:%@",dic);
        block(dic);
        
    }];
}
/*
 *验证旧手机验证码
 */
+(void)VerifyTheOldCellPhoneVerificationCode:(NSString *)validateCode BLOCK:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:validateCode forKey:@"validateCode"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"verificationcode" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"验证旧手机验证码:%@",dic);
        block(dic);
        
    }];
}
/*
 *发送新手机验证码
 */
+(void)SendTheNewPhoneVerificationCode:(NSString *)phone BLOCK:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:phone forKey:@"phone"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"sendnewphone" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"验证旧手机验证码:%@",dic);
        block(dic);
        
    }];
}
/*
 *更换新手机号码
 */
+(void)ChangeTheNewPhoneNumber_phone:(NSString *)phone validateCode:(NSString *)validateCode BLOCK:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:phone forKey:@"phone"];
    [dic setObject:validateCode forKey:@"validateCode"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"bindingphone" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"更换新手机号码:%@",dic);
        block(dic);
        
    }];
}
@end
