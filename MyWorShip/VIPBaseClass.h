//
//  VIPBaseClass.h
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VIPPagingList;

@interface VIPBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, assign) double vipRemainDay;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) double vipMonthConsumed;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) VIPPagingList *pagingList;
@property (nonatomic, assign) double vipMonthTotal;
@property (nonatomic, assign) double vipMonthQuantity;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
