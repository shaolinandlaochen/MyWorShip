//
//  MonthsThanksGoodsBaseClass.m
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MonthsThanksGoodsBaseClass.h"
#import "MonthsThanksGoodsCommodityall.h"


NSString *const kMonthsThanksGoodsBaseClassCode = @"code";
NSString *const kMonthsThanksGoodsBaseClassImgSrc = @"imgSrc";
NSString *const kMonthsThanksGoodsBaseClassCommodityall = @"commodityall";
NSString *const kMonthsThanksGoodsBaseClassMsg = @"msg";


@interface MonthsThanksGoodsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MonthsThanksGoodsBaseClass

@synthesize code = _code;
@synthesize imgSrc = _imgSrc;
@synthesize commodityall = _commodityall;
@synthesize msg = _msg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kMonthsThanksGoodsBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kMonthsThanksGoodsBaseClassImgSrc fromDictionary:dict];
    NSObject *receivedMonthsThanksGoodsCommodityall = [dict objectForKey:kMonthsThanksGoodsBaseClassCommodityall];
    NSMutableArray *parsedMonthsThanksGoodsCommodityall = [NSMutableArray array];
    
    if ([receivedMonthsThanksGoodsCommodityall isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMonthsThanksGoodsCommodityall) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMonthsThanksGoodsCommodityall addObject:[MonthsThanksGoodsCommodityall modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMonthsThanksGoodsCommodityall isKindOfClass:[NSDictionary class]]) {
       [parsedMonthsThanksGoodsCommodityall addObject:[MonthsThanksGoodsCommodityall modelObjectWithDictionary:(NSDictionary *)receivedMonthsThanksGoodsCommodityall]];
    }

    self.commodityall = [NSArray arrayWithArray:parsedMonthsThanksGoodsCommodityall];
            self.msg = [self objectOrNilForKey:kMonthsThanksGoodsBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kMonthsThanksGoodsBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kMonthsThanksGoodsBaseClassImgSrc];
    NSMutableArray *tempArrayForCommodityall = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.commodityall) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCommodityall addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCommodityall addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCommodityall] forKey:kMonthsThanksGoodsBaseClassCommodityall];
    [mutableDict setValue:self.msg forKey:kMonthsThanksGoodsBaseClassMsg];

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

    self.code = [aDecoder decodeObjectForKey:kMonthsThanksGoodsBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kMonthsThanksGoodsBaseClassImgSrc];
    self.commodityall = [aDecoder decodeObjectForKey:kMonthsThanksGoodsBaseClassCommodityall];
    self.msg = [aDecoder decodeObjectForKey:kMonthsThanksGoodsBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kMonthsThanksGoodsBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kMonthsThanksGoodsBaseClassImgSrc];
    [aCoder encodeObject:_commodityall forKey:kMonthsThanksGoodsBaseClassCommodityall];
    [aCoder encodeObject:_msg forKey:kMonthsThanksGoodsBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    MonthsThanksGoodsBaseClass *copy = [[MonthsThanksGoodsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.commodityall = [self.commodityall copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
