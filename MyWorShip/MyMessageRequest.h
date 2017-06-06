//
//  MyMessageRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyMessageRequest : NSObject
/*
 *获取从消息列表
 */
+(void)TheMessageListpage:(NSInteger)page pageSize:(NSInteger)pageSize block:(void(^)(NSDictionary *dic))block;
/*
 *设置消已读
 */
+(void)TheMessageDetailsmessage_id:(NSInteger)message_id block:(void(^)(NSDictionary *dic))block;
@end
