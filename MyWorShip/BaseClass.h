//
//  BaseClass.h
//
//  Created by   on 2017/6/23
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double remain;
@property (nonatomic, assign) double freeCount;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSArray *couponList;
@property (nonatomic, assign) double commoditySellprice;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
