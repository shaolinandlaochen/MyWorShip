//
//  NSObject+DeleteArrOrDeleteDicBothNull.h
//  SexShop
//
//  Created by 陈振辉 on 2016/11/15.
//  Copyright © 2016年 陈振辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DeleteArrOrDeleteDicBothNull)
/**
 *  服务器返回的数据为<null>时的处理
 *
 *  @param dic 经处理过后的数据，数据类型为字典，避免直接取数据时出现程序崩溃现象。
 */
- (NSDictionary *)deleteEmpty:(NSDictionary *)dic;

/**
 *  服务器返回的数据为<null>时的处理
 *
 *  @param arr 经处理过后的数据，数据类型为数组，避免直接取数据时出现程序崩溃现象。
 */
- (NSArray *)deleteEmptyArr:(NSArray *)arr;
@end
