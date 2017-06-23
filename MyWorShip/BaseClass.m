//
//  BaseClass.m
//
//  Created by   on 2017/6/23
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "CouponList.h"


NSString *const kBaseClassRemain = @"remain";
NSString *const kBaseClassFreeCount = @"free_count";
NSString *const kBaseClassCode = @"code";
NSString *const kBaseClassCommodityName = @"commodity_name";
NSString *const kBaseClassMsg = @"msg";
NSString *const kBaseClassCouponList = @"couponList";
NSString *const kBaseClassCommoditySellprice = @"commodity_sellprice";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize remain = _remain;
@synthesize freeCount = _freeCount;
@synthesize code = _code;
@synthesize commodityName = _commodityName;
@synthesize msg = _msg;
@synthesize couponList = _couponList;
@synthesize commoditySellprice = _commoditySellprice;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.remain = [[self objectOrNilForKey:kBaseClassRemain fromDictionary:dict] doubleValue];
            self.freeCount = [[self objectOrNilForKey:kBaseClassFreeCount fromDictionary:dict] doubleValue];
            self.code = [self objectOrNilForKey:kBaseClassCode fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kBaseClassCommodityName fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kBaseClassMsg fromDictionary:dict];
    NSObject *receivedCouponList = [dict objectForKey:kBaseClassCouponList];
    NSMutableArray *parsedCouponList = [NSMutableArray array];
    
    if ([receivedCouponList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCouponList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCouponList addObject:[CouponList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCouponList isKindOfClass:[NSDictionary class]]) {
       [parsedCouponList addObject:[CouponList modelObjectWithDictionary:(NSDictionary *)receivedCouponList]];
    }

    self.couponList = [NSArray arrayWithArray:parsedCouponList];
            self.commoditySellprice = [[self objectOrNilForKey:kBaseClassCommoditySellprice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.remain] forKey:kBaseClassRemain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.freeCount] forKey:kBaseClassFreeCount];
    [mutableDict setValue:self.code forKey:kBaseClassCode];
    [mutableDict setValue:self.commodityName forKey:kBaseClassCommodityName];
    [mutableDict setValue:self.msg forKey:kBaseClassMsg];
    NSMutableArray *tempArrayForCouponList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.couponList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCouponList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCouponList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCouponList] forKey:kBaseClassCouponList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kBaseClassCommoditySellprice];

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

    self.remain = [aDecoder decodeDoubleForKey:kBaseClassRemain];
    self.freeCount = [aDecoder decodeDoubleForKey:kBaseClassFreeCount];
    self.code = [aDecoder decodeObjectForKey:kBaseClassCode];
    self.commodityName = [aDecoder decodeObjectForKey:kBaseClassCommodityName];
    self.msg = [aDecoder decodeObjectForKey:kBaseClassMsg];
    self.couponList = [aDecoder decodeObjectForKey:kBaseClassCouponList];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kBaseClassCommoditySellprice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_remain forKey:kBaseClassRemain];
    [aCoder encodeDouble:_freeCount forKey:kBaseClassFreeCount];
    [aCoder encodeObject:_code forKey:kBaseClassCode];
    [aCoder encodeObject:_commodityName forKey:kBaseClassCommodityName];
    [aCoder encodeObject:_msg forKey:kBaseClassMsg];
    [aCoder encodeObject:_couponList forKey:kBaseClassCouponList];
    [aCoder encodeDouble:_commoditySellprice forKey:kBaseClassCommoditySellprice];
}

- (id)copyWithZone:(NSZone *)zone {
    BaseClass *copy = [[BaseClass alloc] init];
    
    
    
    if (copy) {

        copy.remain = self.remain;
        copy.freeCount = self.freeCount;
        copy.code = [self.code copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.couponList = [self.couponList copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
    }
    
    return copy;
}


@end
