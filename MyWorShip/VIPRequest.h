//
//  VIPRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VIPRequest : NSObject
/*
 *获取VIP数据
 */
+(void)AccessToTheVIPData_page:(NSInteger)page pageSize:(NSInteger)pageSize block:(void(^)(NSDictionary *dic))block;
/*
 *获取VIP消费记录明细
 */
+(void)AccessToTheVIPConsumptionRecordDetails_page:(NSInteger)page pageSize:(NSInteger)pageSize block:(void(^)(NSDictionary *dic))block;
@end
