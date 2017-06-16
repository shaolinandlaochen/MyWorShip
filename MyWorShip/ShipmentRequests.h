//
//  ShipmentRequests.h
//  MyWorShip
//
//  Created by 123 on 2017/6/16.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShipmentRequests : NSObject
/*
 *评价
 */
+(void)evaluation_comment_content:(NSString *)comment_content comment_grade:(NSInteger)comment_grade commodity_serial:(NSString *)commodity_serial order_serial:(NSString *)order_serial block:(void(^)(NSDictionary *dic))block;
@end
