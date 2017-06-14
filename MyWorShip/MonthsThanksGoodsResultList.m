//
//  MonthsThanksGoodsResultList.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MonthsThanksGoodsResultList.h"


NSString *const kMonthsThanksGoodsResultListCommoditySales = @"commodity_sales";
NSString *const kMonthsThanksGoodsResultListCommodityCoverImage = @"commodity_cover_image";
NSString *const kMonthsThanksGoodsResultListCommoditySerial = @"commodity_serial";
NSString *const kMonthsThanksGoodsResultListCommodityName = @"commodity_name";
NSString *const kMonthsThanksGoodsResultListCommodityImagesPath = @"commodity_images_path";
NSString *const kMonthsThanksGoodsResultListCommodityDiscount = @"commodity_discount";
NSString *const kMonthsThanksGoodsResultListCommodityVipSellprice = @"commodity_vip_sellprice";
NSString *const kMonthsThanksGoodsResultListCommoditySellprice = @"commodity_sellprice";
NSString *const kMonthsThanksGoodsResultListCommodityReserves = @"commodity_reserves";


@interface MonthsThanksGoodsResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MonthsThanksGoodsResultList

@synthesize commoditySales = _commoditySales;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityName = _commodityName;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityDiscount = _commodityDiscount;
@synthesize commodityVipSellprice = _commodityVipSellprice;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityReserves = _commodityReserves;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commoditySales = [[self objectOrNilForKey:kMonthsThanksGoodsResultListCommoditySales fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kMonthsThanksGoodsResultListCommodityCoverImage fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kMonthsThanksGoodsResultListCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kMonthsThanksGoodsResultListCommodityName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kMonthsThanksGoodsResultListCommodityImagesPath fromDictionary:dict];
            self.commodityDiscount = [[self objectOrNilForKey:kMonthsThanksGoodsResultListCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityVipSellprice = [[self objectOrNilForKey:kMonthsThanksGoodsResultListCommodityVipSellprice fromDictionary:dict] doubleValue];
            self.commoditySellprice = [[self objectOrNilForKey:kMonthsThanksGoodsResultListCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityReserves = [[self objectOrNilForKey:kMonthsThanksGoodsResultListCommodityReserves fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySales] forKey:kMonthsThanksGoodsResultListCommoditySales];
    [mutableDict setValue:self.commodityCoverImage forKey:kMonthsThanksGoodsResultListCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kMonthsThanksGoodsResultListCommoditySerial];
    [mutableDict setValue:self.commodityName forKey:kMonthsThanksGoodsResultListCommodityName];
    [mutableDict setValue:self.commodityImagesPath forKey:kMonthsThanksGoodsResultListCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kMonthsThanksGoodsResultListCommodityDiscount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityVipSellprice] forKey:kMonthsThanksGoodsResultListCommodityVipSellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kMonthsThanksGoodsResultListCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kMonthsThanksGoodsResultListCommodityReserves];

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

    self.commoditySales = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsResultListCommoditySales];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kMonthsThanksGoodsResultListCommodityCoverImage];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsResultListCommoditySerial];
    self.commodityName = [aDecoder decodeObjectForKey:kMonthsThanksGoodsResultListCommodityName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kMonthsThanksGoodsResultListCommodityImagesPath];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsResultListCommodityDiscount];
    self.commodityVipSellprice = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsResultListCommodityVipSellprice];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsResultListCommoditySellprice];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsResultListCommodityReserves];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commoditySales forKey:kMonthsThanksGoodsResultListCommoditySales];
    [aCoder encodeObject:_commodityCoverImage forKey:kMonthsThanksGoodsResultListCommodityCoverImage];
    [aCoder encodeDouble:_commoditySerial forKey:kMonthsThanksGoodsResultListCommoditySerial];
    [aCoder encodeObject:_commodityName forKey:kMonthsThanksGoodsResultListCommodityName];
    [aCoder encodeObject:_commodityImagesPath forKey:kMonthsThanksGoodsResultListCommodityImagesPath];
    [aCoder encodeDouble:_commodityDiscount forKey:kMonthsThanksGoodsResultListCommodityDiscount];
    [aCoder encodeDouble:_commodityVipSellprice forKey:kMonthsThanksGoodsResultListCommodityVipSellprice];
    [aCoder encodeDouble:_commoditySellprice forKey:kMonthsThanksGoodsResultListCommoditySellprice];
    [aCoder encodeDouble:_commodityReserves forKey:kMonthsThanksGoodsResultListCommodityReserves];
}

- (id)copyWithZone:(NSZone *)zone {
    MonthsThanksGoodsResultList *copy = [[MonthsThanksGoodsResultList alloc] init];
    
    
    
    if (copy) {

        copy.commoditySales = self.commoditySales;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityDiscount = self.commodityDiscount;
        copy.commodityVipSellprice = self.commodityVipSellprice;
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityReserves = self.commodityReserves;
    }
    
    return copy;
}


@end
