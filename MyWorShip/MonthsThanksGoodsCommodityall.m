//
//  MonthsThanksGoodsCommodityall.m
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MonthsThanksGoodsCommodityall.h"


NSString *const kMonthsThanksGoodsCommodityallCommoditySales = @"commodity_sales";
NSString *const kMonthsThanksGoodsCommodityallCommodityCoverImage = @"commodity_cover_image";
NSString *const kMonthsThanksGoodsCommodityallCommoditySerial = @"commodity_serial";
NSString *const kMonthsThanksGoodsCommodityallCommodityName = @"commodity_name";
NSString *const kMonthsThanksGoodsCommodityallCommodityImagesPath = @"commodity_images_path";
NSString *const kMonthsThanksGoodsCommodityallCommodityDiscount = @"commodity_discount";
NSString *const kMonthsThanksGoodsCommodityallCommodityVipSellprice = @"commodity_vip_sellprice";
NSString *const kMonthsThanksGoodsCommodityallCommoditySellprice = @"commodity_sellprice";
NSString *const kMonthsThanksGoodsCommodityallCommodityReserves = @"commodity_reserves";


@interface MonthsThanksGoodsCommodityall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MonthsThanksGoodsCommodityall

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
            self.commoditySales = [[self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommoditySales fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommodityCoverImage fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommodityName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommodityImagesPath fromDictionary:dict];
            self.commodityDiscount = [[self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityVipSellprice = [[self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommodityVipSellprice fromDictionary:dict] doubleValue];
            self.commoditySellprice = [[self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityReserves = [[self objectOrNilForKey:kMonthsThanksGoodsCommodityallCommodityReserves fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySales] forKey:kMonthsThanksGoodsCommodityallCommoditySales];
    [mutableDict setValue:self.commodityCoverImage forKey:kMonthsThanksGoodsCommodityallCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kMonthsThanksGoodsCommodityallCommoditySerial];
    [mutableDict setValue:self.commodityName forKey:kMonthsThanksGoodsCommodityallCommodityName];
    [mutableDict setValue:self.commodityImagesPath forKey:kMonthsThanksGoodsCommodityallCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kMonthsThanksGoodsCommodityallCommodityDiscount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityVipSellprice] forKey:kMonthsThanksGoodsCommodityallCommodityVipSellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kMonthsThanksGoodsCommodityallCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kMonthsThanksGoodsCommodityallCommodityReserves];

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

    self.commoditySales = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsCommodityallCommoditySales];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kMonthsThanksGoodsCommodityallCommodityCoverImage];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsCommodityallCommoditySerial];
    self.commodityName = [aDecoder decodeObjectForKey:kMonthsThanksGoodsCommodityallCommodityName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kMonthsThanksGoodsCommodityallCommodityImagesPath];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsCommodityallCommodityDiscount];
    self.commodityVipSellprice = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsCommodityallCommodityVipSellprice];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsCommodityallCommoditySellprice];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsCommodityallCommodityReserves];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commoditySales forKey:kMonthsThanksGoodsCommodityallCommoditySales];
    [aCoder encodeObject:_commodityCoverImage forKey:kMonthsThanksGoodsCommodityallCommodityCoverImage];
    [aCoder encodeDouble:_commoditySerial forKey:kMonthsThanksGoodsCommodityallCommoditySerial];
    [aCoder encodeObject:_commodityName forKey:kMonthsThanksGoodsCommodityallCommodityName];
    [aCoder encodeObject:_commodityImagesPath forKey:kMonthsThanksGoodsCommodityallCommodityImagesPath];
    [aCoder encodeDouble:_commodityDiscount forKey:kMonthsThanksGoodsCommodityallCommodityDiscount];
    [aCoder encodeDouble:_commodityVipSellprice forKey:kMonthsThanksGoodsCommodityallCommodityVipSellprice];
    [aCoder encodeDouble:_commoditySellprice forKey:kMonthsThanksGoodsCommodityallCommoditySellprice];
    [aCoder encodeDouble:_commodityReserves forKey:kMonthsThanksGoodsCommodityallCommodityReserves];
}

- (id)copyWithZone:(NSZone *)zone {
    MonthsThanksGoodsCommodityall *copy = [[MonthsThanksGoodsCommodityall alloc] init];
    
    
    
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
