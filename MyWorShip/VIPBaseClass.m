//
//  VIPBaseClass.m
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "VIPBaseClass.h"
#import "VIPPagingList.h"


NSString *const kVIPBaseClassImgSrc = @"imgSrc";
NSString *const kVIPBaseClassVipRemainDay = @"vip_remain_day";
NSString *const kVIPBaseClassCode = @"code";
NSString *const kVIPBaseClassVipMonthConsumed = @"vip_month_consumed";
NSString *const kVIPBaseClassMsg = @"msg";
NSString *const kVIPBaseClassPagingList = @"pagingList";
NSString *const kVIPBaseClassVipMonthTotal = @"vip_month_total";
NSString *const kVIPBaseClassVipMonthQuantity = @"vip_month_quantity";


@interface VIPBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VIPBaseClass

@synthesize imgSrc = _imgSrc;
@synthesize vipRemainDay = _vipRemainDay;
@synthesize code = _code;
@synthesize vipMonthConsumed = _vipMonthConsumed;
@synthesize msg = _msg;
@synthesize pagingList = _pagingList;
@synthesize vipMonthTotal = _vipMonthTotal;
@synthesize vipMonthQuantity = _vipMonthQuantity;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.imgSrc = [self objectOrNilForKey:kVIPBaseClassImgSrc fromDictionary:dict];
            self.vipRemainDay = [[self objectOrNilForKey:kVIPBaseClassVipRemainDay fromDictionary:dict] doubleValue];
            self.code = [self objectOrNilForKey:kVIPBaseClassCode fromDictionary:dict];
            self.vipMonthConsumed = [[self objectOrNilForKey:kVIPBaseClassVipMonthConsumed fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kVIPBaseClassMsg fromDictionary:dict];
            self.pagingList = [VIPPagingList modelObjectWithDictionary:[dict objectForKey:kVIPBaseClassPagingList]];
            self.vipMonthTotal = [[self objectOrNilForKey:kVIPBaseClassVipMonthTotal fromDictionary:dict] doubleValue];
            self.vipMonthQuantity = [[self objectOrNilForKey:kVIPBaseClassVipMonthQuantity fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgSrc forKey:kVIPBaseClassImgSrc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipRemainDay] forKey:kVIPBaseClassVipRemainDay];
    [mutableDict setValue:self.code forKey:kVIPBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipMonthConsumed] forKey:kVIPBaseClassVipMonthConsumed];
    [mutableDict setValue:self.msg forKey:kVIPBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kVIPBaseClassPagingList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipMonthTotal] forKey:kVIPBaseClassVipMonthTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipMonthQuantity] forKey:kVIPBaseClassVipMonthQuantity];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.imgSrc = [aDecoder decodeObjectForKey:kVIPBaseClassImgSrc];
    self.vipRemainDay = [aDecoder decodeDoubleForKey:kVIPBaseClassVipRemainDay];
    self.code = [aDecoder decodeObjectForKey:kVIPBaseClassCode];
    self.vipMonthConsumed = [aDecoder decodeDoubleForKey:kVIPBaseClassVipMonthConsumed];
    self.msg = [aDecoder decodeObjectForKey:kVIPBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kVIPBaseClassPagingList];
    self.vipMonthTotal = [aDecoder decodeDoubleForKey:kVIPBaseClassVipMonthTotal];
    self.vipMonthQuantity = [aDecoder decodeDoubleForKey:kVIPBaseClassVipMonthQuantity];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgSrc forKey:kVIPBaseClassImgSrc];
    [aCoder encodeDouble:_vipRemainDay forKey:kVIPBaseClassVipRemainDay];
    [aCoder encodeObject:_code forKey:kVIPBaseClassCode];
    [aCoder encodeDouble:_vipMonthConsumed forKey:kVIPBaseClassVipMonthConsumed];
    [aCoder encodeObject:_msg forKey:kVIPBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kVIPBaseClassPagingList];
    [aCoder encodeDouble:_vipMonthTotal forKey:kVIPBaseClassVipMonthTotal];
    [aCoder encodeDouble:_vipMonthQuantity forKey:kVIPBaseClassVipMonthQuantity];
}

- (id)copyWithZone:(NSZone *)zone {
    VIPBaseClass *copy = [[VIPBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.vipRemainDay = self.vipRemainDay;
        copy.code = [self.code copyWithZone:zone];
        copy.vipMonthConsumed = self.vipMonthConsumed;
        copy.msg = [self.msg copyWithZone:zone];
        copy.pagingList = [self.pagingList copyWithZone:zone];
        copy.vipMonthTotal = self.vipMonthTotal;
        copy.vipMonthQuantity = self.vipMonthQuantity;
    }
    
    return copy;
}


@end
