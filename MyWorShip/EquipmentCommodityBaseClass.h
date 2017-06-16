//
//  EquipmentCommodityBaseClass.h
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EquipmentCommodityPagingList;

@interface EquipmentCommodityBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) EquipmentCommodityPagingList *pagingList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
