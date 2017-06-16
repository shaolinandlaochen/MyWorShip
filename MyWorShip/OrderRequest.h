//
//  OrderRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/16.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderRequest : NSObject
/*
 *获取订单列表
 */
+(void)ToObtainAListOrder_page:(NSInteger)page pageSize:(NSInteger)pageSize type:(NSString *)type block:(void(^)(NSDictionary *dic))block;
@end
