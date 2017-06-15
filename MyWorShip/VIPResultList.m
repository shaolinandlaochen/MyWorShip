//
//  VIPResultList.m
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "VIPResultList.h"


NSString *const kVIPResultListCommoditySales = @"commodity_sales";
NSString *const kVIPResultListCommodityCoverImage = @"commodity_cover_image";
NSString *const kVIPResultListCommoditySerial = @"commodity_serial";
NSString *const kVIPResultListCommodityName = @"commodity_name";
NSString *const kVIPResultListCommodityImagesPath = @"commodity_images_path";
NSString *const kVIPResultListCommodityDiscount = @"commodity_discount";
NSString *const kVIPResultListCommodityVipSellprice = @"commodity_vip_sellprice";
NSString *const kVIPResultListCommoditySellprice = @"commodity_sellprice";
NSString *const kVIPResultListCommodityReserves = @"commodity_reserves";


@interface VIPResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VIPResultList

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
            self.commoditySales = [[self objectOrNilForKey:kVIPResultListCommoditySales fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kVIPResultListCommodityCoverImage fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kVIPResultListCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kVIPResultListCommodityName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kVIPResultListCommodityImagesPath fromDictionary:dict];
            self.commodityDiscount = [[self objectOrNilForKey:kVIPResultListCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityVipSellprice = [[self objectOrNilForKey:kVIPResultListCommodityVipSellprice fromDictionary:dict] doubleValue];
            self.commoditySellprice = [[self objectOrNilForKey:kVIPResultListCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityReserves = [[self objectOrNilForKey:kVIPResultListCommodityReserves fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySales] forKey:kVIPResultListCommoditySales];
    [mutableDict setValue:self.commodityCoverImage forKey:kVIPResultListCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kVIPResultListCommoditySerial];
    [mutableDict setValue:self.commodityName forKey:kVIPResultListCommodityName];
    [mutableDict setValue:self.commodityImagesPath forKey:kVIPResultListCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kVIPResultListCommodityDiscount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityVipSellprice] forKey:kVIPResultListCommodityVipSellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kVIPResultListCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kVIPResultListCommodityReserves];

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

    self.commoditySales = [aDecoder decodeDoubleForKey:kVIPResultListCommoditySales];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kVIPResultListCommodityCoverImage];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kVIPResultListCommoditySerial];
    self.commodityName = [aDecoder decodeObjectForKey:kVIPResultListCommodityName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kVIPResultListCommodityImagesPath];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kVIPResultListCommodityDiscount];
    self.commodityVipSellprice = [aDecoder decodeDoubleForKey:kVIPResultListCommodityVipSellprice];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kVIPResultListCommoditySellprice];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kVIPResultListCommodityReserves];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commoditySales forKey:kVIPResultListCommoditySales];
    [aCoder encodeObject:_commodityCoverImage forKey:kVIPResultListCommodityCoverImage];
    [aCoder encodeDouble:_commoditySerial forKey:kVIPResultListCommoditySerial];
    [aCoder encodeObject:_commodityName forKey:kVIPResultListCommodityName];
    [aCoder encodeObject:_commodityImagesPath forKey:kVIPResultListCommodityImagesPath];
    [aCoder encodeDouble:_commodityDiscount forKey:kVIPResultListCommodityDiscount];
    [aCoder encodeDouble:_commodityVipSellprice forKey:kVIPResultListCommodityVipSellprice];
    [aCoder encodeDouble:_commoditySellprice forKey:kVIPResultListCommoditySellprice];
    [aCoder encodeDouble:_commodityReserves forKey:kVIPResultListCommodityReserves];
}

- (id)copyWithZone:(NSZone *)zone {
    VIPResultList *copy = [[VIPResultList alloc] init];
    
    
    
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
