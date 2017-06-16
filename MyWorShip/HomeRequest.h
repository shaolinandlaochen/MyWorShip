//
//  HomeRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/14.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeRequest : NSObject
/*
 *查找附近的设备
 */
+(void)TheDeviceNearTheQuery_equipment_longitude:(NSString *)equipment_longitude equipment_latitude:(NSString *)equipment_latitude block:(void(^)(NSDictionary *dic))block;

@end
