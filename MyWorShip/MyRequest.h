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
@end
