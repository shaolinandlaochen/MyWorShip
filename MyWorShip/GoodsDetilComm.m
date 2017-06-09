//
//  GoodsDetilComm.m
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetilComm.h"


NSString *const kGoodsDetilCommCommodityIscoupon = @"commodity_iscoupon";
NSString *const kGoodsDetilCommCommodityWeight = @"commodity_weight";
NSString *const kGoodsDetilCommCommodityCoverImage = @"commodity_cover_image";
NSString *const kGoodsDetilCommCommoditySales = @"commodity_sales";
NSString *const kGoodsDetilCommCommodityDiscount = @"commodity_discount";
NSString *const kGoodsDetilCommCommodityIndexImage1 = @"commodity_index_image_1";
NSString *const kGoodsDetilCommCommodityMarketprice = @"commodity_marketprice";
NSString *const kGoodsDetilCommCommodityVipSellprice = @"commodity_vip_sellprice";
NSString *const kGoodsDetilCommCommodityGrade = @"commodity_grade";
NSString *const kGoodsDetilCommCommodityImagesPath = @"commodity_images_path";
NSString *const kGoodsDetilCommId = @"id";
NSString *const kGoodsDetilCommCommodityProarea = @"commodity_proarea";
NSString *const kGoodsDetilCommCommodityImages = @"commodity_images";
NSString *const kGoodsDetilCommCommodityManufacturer = @"commodity_manufacturer";
NSString *const kGoodsDetilCommCommoditySellprice = @"commodity_sellprice";
NSString *const kGoodsDetilCommCommodityReserves = @"commodity_reserves";
NSString *const kGoodsDetilCommCommoditySerial = @"commodity_serial";
NSString *const kGoodsDetilCommCommodityLookcount = @"commodity_lookcount";
NSString *const kGoodsDetilCommCommodityName = @"commodity_name";
NSString *const kGoodsDetilCommCommodityDesc = @"commodity_desc";


@interface GoodsDetilComm ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetilComm

@synthesize commodityIscoupon = _commodityIscoupon;
@synthesize commodityWeight = _commodityWeight;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commoditySales = _commoditySales;
@synthesize commodityDiscount = _commodityDiscount;
@synthesize commodityIndexImage1 = _commodityIndexImage1;
@synthesize commodityMarketprice = _commodityMarketprice;
@synthesize commodityVipSellprice = _commodityVipSellprice;
@synthesize commodityGrade = _commodityGrade;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commIdentifier = _commIdentifier;
@synthesize commodityProarea = _commodityProarea;
@synthesize commodityImages = _commodityImages;
@synthesize commodityManufacturer = _commodityManufacturer;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityReserves = _commodityReserves;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityLookcount = _commodityLookcount;
@synthesize commodityName = _commodityName;
@synthesize commodityDesc = _commodityDesc;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commodityIscoupon = [[self objectOrNilForKey:kGoodsDetilCommCommodityIscoupon fromDictionary:dict] doubleValue];
            self.commodityWeight = [[self objectOrNilForKey:kGoodsDetilCommCommodityWeight fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kGoodsDetilCommCommodityCoverImage fromDictionary:dict];
            self.commoditySales = [[self objectOrNilForKey:kGoodsDetilCommCommoditySales fromDictionary:dict] doubleValue];
            self.commodityDiscount = [[self objectOrNilForKey:kGoodsDetilCommCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityIndexImage1 = [self objectOrNilForKey:kGoodsDetilCommCommodityIndexImage1 fromDictionary:dict];
            self.commodityMarketprice = [[self objectOrNilForKey:kGoodsDetilCommCommodityMarketprice fromDictionary:dict] doubleValue];
            self.commodityVipSellprice = [[self objectOrNilForKey:kGoodsDetilCommCommodityVipSellprice fromDictionary:dict] doubleValue];
            self.commodityGrade = [[self objectOrNilForKey:kGoodsDetilCommCommodityGrade fromDictionary:dict] doubleValue];
            self.commodityImagesPath = [self objectOrNilForKey:kGoodsDetilCommCommodityImagesPath fromDictionary:dict];
            self.commIdentifier = [[self objectOrNilForKey:kGoodsDetilCommId fromDictionary:dict] doubleValue];
            self.commodityProarea = [self objectOrNilForKey:kGoodsDetilCommCommodityProarea fromDictionary:dict];
            self.commodityImages = [self objectOrNilForKey:kGoodsDetilCommCommodityImages fromDictionary:dict];
            self.commodityManufacturer = [self objectOrNilForKey:kGoodsDetilCommCommodityManufacturer fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kGoodsDetilCommCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityReserves = [[self objectOrNilForKey:kGoodsDetilCommCommodityReserves fromDictionary:dict] doubleValue];
            self.commoditySerial = [[self objectOrNilForKey:kGoodsDetilCommCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityLookcount = [[self objectOrNilForKey:kGoodsDetilCommCommodityLookcount fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kGoodsDetilCommCommodityName fromDictionary:dict];
            self.commodityDesc = [self objectOrNilForKey:kGoodsDetilCommCommodityDesc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIscoupon] forKey:kGoodsDetilCommCommodityIscoupon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityWeight] forKey:kGoodsDetilCommCommodityWeight];
    [mutableDict setValue:self.commodityCoverImage forKey:kGoodsDetilCommCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySales] forKey:kGoodsDetilCommCommoditySales];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kGoodsDetilCommCommodityDiscount];
    [mutableDict setValue:self.commodityIndexImage1 forKey:kGoodsDetilCommCommodityIndexImage1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityMarketprice] forKey:kGoodsDetilCommCommodityMarketprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityVipSellprice] forKey:kGoodsDetilCommCommodityVipSellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityGrade] forKey:kGoodsDetilCommCommodityGrade];
    [mutableDict setValue:self.commodityImagesPath forKey:kGoodsDetilCommCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commIdentifier] forKey:kGoodsDetilCommId];
    [mutableDict setValue:self.commodityProarea forKey:kGoodsDetilCommCommodityProarea];
    [mutableDict setValue:self.commodityImages forKey:kGoodsDetilCommCommodityImages];
    [mutableDict setValue:self.commodityManufacturer forKey:kGoodsDetilCommCommodityManufacturer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kGoodsDetilCommCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kGoodsDetilCommCommodityReserves];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kGoodsDetilCommCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityLookcount] forKey:kGoodsDetilCommCommodityLookcount];
    [mutableDict setValue:self.commodityName forKey:kGoodsDetilCommCommodityName];
    [mutableDict setValue:self.commodityDesc forKey:kGoodsDetilCommCommodityDesc];

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

    self.commodityIscoupon = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommodityIscoupon];
    self.commodityWeight = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommodityWeight];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kGoodsDetilCommCommodityCoverImage];
    self.commoditySales = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommoditySales];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommodityDiscount];
    self.commodityIndexImage1 = [aDecoder decodeObjectForKey:kGoodsDetilCommCommodityIndexImage1];
    self.commodityMarketprice = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommodityMarketprice];
    self.commodityVipSellprice = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommodityVipSellprice];
    self.commodityGrade = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommodityGrade];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kGoodsDetilCommCommodityImagesPath];
    self.commIdentifier = [aDecoder decodeDoubleForKey:kGoodsDetilCommId];
    self.commodityProarea = [aDecoder decodeObjectForKey:kGoodsDetilCommCommodityProarea];
    self.commodityImages = [aDecoder decodeObjectForKey:kGoodsDetilCommCommodityImages];
    self.commodityManufacturer = [aDecoder decodeObjectForKey:kGoodsDetilCommCommodityManufacturer];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommoditySellprice];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommodityReserves];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommoditySerial];
    self.commodityLookcount = [aDecoder decodeDoubleForKey:kGoodsDetilCommCommodityLookcount];
    self.commodityName = [aDecoder decodeObjectForKey:kGoodsDetilCommCommodityName];
    self.commodityDesc = [aDecoder decodeObjectForKey:kGoodsDetilCommCommodityDesc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commodityIscoupon forKey:kGoodsDetilCommCommodityIscoupon];
    [aCoder encodeDouble:_commodityWeight forKey:kGoodsDetilCommCommodityWeight];
    [aCoder encodeObject:_commodityCoverImage forKey:kGoodsDetilCommCommodityCoverImage];
    [aCoder encodeDouble:_commoditySales forKey:kGoodsDetilCommCommoditySales];
    [aCoder encodeDouble:_commodityDiscount forKey:kGoodsDetilCommCommodityDiscount];
    [aCoder encodeObject:_commodityIndexImage1 forKey:kGoodsDetilCommCommodityIndexImage1];
    [aCoder encodeDouble:_commodityMarketprice forKey:kGoodsDetilCommCommodityMarketprice];
    [aCoder encodeDouble:_commodityVipSellprice forKey:kGoodsDetilCommCommodityVipSellprice];
    [aCoder encodeDouble:_commodityGrade forKey:kGoodsDetilCommCommodityGrade];
    [aCoder encodeObject:_commodityImagesPath forKey:kGoodsDetilCommCommodityImagesPath];
    [aCoder encodeDouble:_commIdentifier forKey:kGoodsDetilCommId];
    [aCoder encodeObject:_commodityProarea forKey:kGoodsDetilCommCommodityProarea];
    [aCoder encodeObject:_commodityImages forKey:kGoodsDetilCommCommodityImages];
    [aCoder encodeObject:_commodityManufacturer forKey:kGoodsDetilCommCommodityManufacturer];
    [aCoder encodeDouble:_commoditySellprice forKey:kGoodsDetilCommCommoditySellprice];
    [aCoder encodeDouble:_commodityReserves forKey:kGoodsDetilCommCommodityReserves];
    [aCoder encodeDouble:_commoditySerial forKey:kGoodsDetilCommCommoditySerial];
    [aCoder encodeDouble:_commodityLookcount forKey:kGoodsDetilCommCommodityLookcount];
    [aCoder encodeObject:_commodityName forKey:kGoodsDetilCommCommodityName];
    [aCoder encodeObject:_commodityDesc forKey:kGoodsDetilCommCommodityDesc];
}

- (id)copyWithZone:(NSZone *)zone {
    GoodsDetilComm *copy = [[GoodsDetilComm alloc] init];
    
    
    
    if (copy) {

        copy.commodityIscoupon = self.commodityIscoupon;
        copy.commodityWeight = self.commodityWeight;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commoditySales = self.commoditySales;
        copy.commodityDiscount = self.commodityDiscount;
        copy.commodityIndexImage1 = [self.commodityIndexImage1 copyWithZone:zone];
        copy.commodityMarketprice = self.commodityMarketprice;
        copy.commodityVipSellprice = self.commodityVipSellprice;
        copy.commodityGrade = self.commodityGrade;
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commIdentifier = self.commIdentifier;
        copy.commodityProarea = [self.commodityProarea copyWithZone:zone];
        copy.commodityImages = [self.commodityImages copyWithZone:zone];
        copy.commodityManufacturer = [self.commodityManufacturer copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityReserves = self.commodityReserves;
        copy.commoditySerial = self.commoditySerial;
        copy.commodityLookcount = self.commodityLookcount;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityDesc = [self.commodityDesc copyWithZone:zone];
    }
    
    return copy;
}


@end
