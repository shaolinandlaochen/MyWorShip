//
//  LoginRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequest : NSObject
/*
 *登录
 */
+(void)TheLoginRequestPhone:(NSString *)phone code:(NSString *)code block:(void(^)(NSDictionary *dic))block;
/*
 *获取验证码
 */
+(void)TheCode:(NSString *)phone block:(void(^)(NSDictionary *dic))block;
@end
