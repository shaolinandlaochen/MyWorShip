//
//  EquipmentCommodityResultList.m
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "EquipmentCommodityResultList.h"


NSString *const kEquipmentCommodityResultListCommodityReserves = @"commodity_reserves";
NSString *const kEquipmentCommodityResultListEquipmentUuid = @"equipment_uuid";
NSString *const kEquipmentCommodityResultListCommoditySerial = @"commodity_serial";
NSString *const kEquipmentCommodityResultListCommodityCoverImage = @"commodity_cover_image";
NSString *const kEquipmentCommodityResultListCommodityName = @"commodity_name";
NSString *const kEquipmentCommodityResultListCommodityImagesPath = @"commodity_images_path";
NSString *const kEquipmentCommodityResultListCommodityVipSellprice = @"commodity_vip_sellprice";
NSString *const kEquipmentCommodityResultListCommoditySellprice = @"commodity_sellprice";
NSString *const kEquipmentCommodityResultListCommodityIsfree = @"commodity_isfree";
NSString *const kEquipmentCommodityResultListCommoditySales = @"commodity_sales";


@interface EquipmentCommodityResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EquipmentCommodityResultList

@synthesize commodityReserves = _commodityReserves;
@synthesize equipmentUuid = _equipmentUuid;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commodityName = _commodityName;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityVipSellprice = _commodityVipSellprice;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityIsfree = _commodityIsfree;
@synthesize commoditySales = _commoditySales;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commodityReserves = [[self objectOrNilForKey:kEquipmentCommodityResultListCommodityReserves fromDictionary:dict] doubleValue];
            self.equipmentUuid = [[self objectOrNilForKey:kEquipmentCommodityResultListEquipmentUuid fromDictionary:dict] doubleValue];
            self.commoditySerial = [[self objectOrNilForKey:kEquipmentCommodityResultListCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kEquipmentCommodityResultListCommodityCoverImage fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kEquipmentCommodityResultListCommodityName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kEquipmentCommodityResultListCommodityImagesPath fromDictionary:dict];
            self.commodityVipSellprice = [[self objectOrNilForKey:kEquipmentCommodityResultListCommodityVipSellprice fromDictionary:dict] doubleValue];
            self.commoditySellprice = [[self objectOrNilForKey:kEquipmentCommodityResultListCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityIsfree = [[self objectOrNilForKey:kEquipmentCommodityResultListCommodityIsfree fromDictionary:dict] doubleValue];
            self.commoditySales = [[self objectOrNilForKey:kEquipmentCommodityResultListCommoditySales fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kEquipmentCommodityResultListCommodityReserves];
    [mutableDict setValue:[NSNumber numberWithDouble:self.equipmentUuid] forKey:kEquipmentCommodityResultListEquipmentUuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kEquipmentCommodityResultListCommoditySerial];
    [mutableDict setValue:self.commodityCoverImage forKey:kEquipmentCommodityResultListCommodityCoverImage];
    [mutableDict setValue:self.commodityName forKey:kEquipmentCommodityResultListCommodityName];
    [mutableDict setValue:self.commodityImagesPath forKey:kEquipmentCommodityResultListCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityVipSellprice] forKey:kEquipmentCommodityResultListCommodityVipSellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kEquipmentCommodityResultListCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsfree] forKey:kEquipmentCommodityResultListCommodityIsfree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySales] forKey:kEquipmentCommodityResultListCommoditySales];

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

    self.commodityReserves = [aDecoder decodeDoubleForKey:kEquipmentCommodityResultListCommodityReserves];
    self.equipmentUuid = [aDecoder decodeDoubleForKey:kEquipmentCommodityResultListEquipmentUuid];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kEquipmentCommodityResultListCommoditySerial];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kEquipmentCommodityResultListCommodityCoverImage];
    self.commodityName = [aDecoder decodeObjectForKey:kEquipmentCommodityResultListCommodityName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kEquipmentCommodityResultListCommodityImagesPath];
    self.commodityVipSellprice = [aDecoder decodeDoubleForKey:kEquipmentCommodityResultListCommodityVipSellprice];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kEquipmentCommodityResultListCommoditySellprice];
    self.commodityIsfree = [aDecoder decodeDoubleForKey:kEquipmentCommodityResultListCommodityIsfree];
    self.commoditySales = [aDecoder decodeDoubleForKey:kEquipmentCommodityResultListCommoditySales];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commodityReserves forKey:kEquipmentCommodityResultListCommodityReserves];
    [aCoder encodeDouble:_equipmentUuid forKey:kEquipmentCommodityResultListEquipmentUuid];
    [aCoder encodeDouble:_commoditySerial forKey:kEquipmentCommodityResultListCommoditySerial];
    [aCoder encodeObject:_commodityCoverImage forKey:kEquipmentCommodityResultListCommodityCoverImage];
    [aCoder encodeObject:_commodityName forKey:kEquipmentCommodityResultListCommodityName];
    [aCoder encodeObject:_commodityImagesPath forKey:kEquipmentCommodityResultListCommodityImagesPath];
    [aCoder encodeDouble:_commodityVipSellprice forKey:kEquipmentCommodityResultListCommodityVipSellprice];
    [aCoder encodeDouble:_commoditySellprice forKey:kEquipmentCommodityResultListCommoditySellprice];
    [aCoder encodeDouble:_commodityIsfree forKey:kEquipmentCommodityResultListCommodityIsfree];
    [aCoder encodeDouble:_commoditySales forKey:kEquipmentCommodityResultListCommoditySales];
}

- (id)copyWithZone:(NSZone *)zone {
    EquipmentCommodityResultList *copy = [[EquipmentCommodityResultList alloc] init];
    
    
    
    if (copy) {

        copy.commodityReserves = self.commodityReserves;
        copy.equipmentUuid = self.equipmentUuid;
        copy.commoditySerial = self.commoditySerial;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityVipSellprice = self.commodityVipSellprice;
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityIsfree = self.commodityIsfree;
        copy.commoditySales = self.commoditySales;
    }
    
    return copy;
}


@end
