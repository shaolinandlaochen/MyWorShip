//
//  RequestClass.h
//  GFreemall
//
//  Created by 123 on 2017/4/13.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestClass : NSObject
//post请求
+(void)postUrl:(NSString *)url Dic:(NSDictionary *)dic block:(void(^)(NSDictionary *dic))block;
//get请求
+(void)getUrl:(NSString *)urlStr Dic:(NSDictionary *)dic block:(void(^)(NSDictionary *dic))block;

@end
