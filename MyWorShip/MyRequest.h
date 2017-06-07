//
//  MyRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyRequest : NSObject
/*
 *获取基本信息
 */
+(void)AccessToEssentialInformationBLOCK:(void(^)(NSDictionary *dic))block;
/*
 *修改昵称
 */
+(void)NicknameChange_base_is_nickname:(NSString *)base_is_nickname BLOCK:(void(^)(NSDictionary *dic))block;
/*
 *设置性别
 */
+(void)setSex_base_sex:(NSInteger)base_sex BLOCK:(void(^)(NSDictionary *dic))block;
/*
 *设置生理期的时间
 */
+(void)PhysiologicalPeriodOfTime:(NSString *)base_period_date BLOCK:(void(^)(NSDictionary *dic))block;
/*
 *发送旧手机验证码
 */
+(void)SendTheOldPhoneVerificationCodeBLOCK:(void(^)(NSDictionary *dic))block;
/*
 *验证旧手机验证码
 */
+(void)VerifyTheOldCellPhoneVerificationCode:(NSString *)validateCode BLOCK:(void(^)(NSDictionary *dic))block;
/*
 *发送新手机验证码
 */
+(void)SendTheNewPhoneVerificationCode:(NSString *)phone BLOCK:(void(^)(NSDictionary *dic))block;
/*
 *更换新手机号码
 */
+(void)ChangeTheNewPhoneNumber_phone:(NSString *)phone validateCode:(NSString *)validateCode BLOCK:(void(^)(NSDictionary *dic))block;
@end
