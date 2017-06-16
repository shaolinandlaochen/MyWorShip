//
//  OrderResultList.m
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderResultList.h"


NSString *const kOrderResultListCommoditySerial = @"commodity_serial";
NSString *const kOrderResultListOrderSerial = @"order_serial";
NSString *const kOrderResultListOrderAmount = @"order_amount";
NSString *const kOrderResultListCommodityName = @"commodity_name";
NSString *const kOrderResultListEquipmentAddress = @"equipment_address";
NSString *const kOrderResultListOrderState = @"order_state";
NSString *const kOrderResultListCommodityId = @"commodity_id";
NSString *const kOrderResultListOrderTime = @"order_time";


@interface OrderResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderResultList

@synthesize commoditySerial = _commoditySerial;
@synthesize orderSerial = _orderSerial;
@synthesize orderAmount = _orderAmount;
@synthesize commodityName = _commodityName;
@synthesize equipmentAddress = _equipmentAddress;
@synthesize orderState = _orderState;
@synthesize commodityId = _commodityId;
@synthesize orderTime = _orderTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commoditySerial = [[self objectOrNilForKey:kOrderResultListCommoditySerial fromDictionary:dict] doubleValue];
            self.orderSerial = [[self objectOrNilForKey:kOrderResultListOrderSerial fromDictionary:dict] doubleValue];
            self.orderAmount = [[self objectOrNilForKey:kOrderResultListOrderAmount fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kOrderResultListCommodityName fromDictionary:dict];
            self.equipmentAddress = [self objectOrNilForKey:kOrderResultListEquipmentAddress fromDictionary:dict];
            self.orderState = [[self objectOrNilForKey:kOrderResultListOrderState fromDictionary:dict] doubleValue];
            self.commodityId = [[self objectOrNilForKey:kOrderResultListCommodityId fromDictionary:dict] doubleValue];
            self.orderTime = [self objectOrNilForKey:kOrderResultListOrderTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kOrderResultListCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderSerial] forKey:kOrderResultListOrderSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderAmount] forKey:kOrderResultListOrderAmount];
    [mutableDict setValue:self.commodityName forKey:kOrderResultListCommodityName];
    [mutableDict setValue:self.equipmentAddress forKey:kOrderResultListEquipmentAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderState] forKey:kOrderResultListOrderState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityId] forKey:kOrderResultListCommodityId];
    [mutableDict setValue:self.orderTime forKey:kOrderResultListOrderTime];

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

    self.commoditySerial = [aDecoder decodeDoubleForKey:kOrderResultListCommoditySerial];
    self.orderSerial = [aDecoder decodeDoubleForKey:kOrderResultListOrderSerial];
    self.orderAmount = [aDecoder decodeDoubleForKey:kOrderResultListOrderAmount];
    self.commodityName = [aDecoder decodeObjectForKey:kOrderResultListCommodityName];
    self.equipmentAddress = [aDecoder decodeObjectForKey:kOrderResultListEquipmentAddress];
    self.orderState = [aDecoder decodeDoubleForKey:kOrderResultListOrderState];
    self.commodityId = [aDecoder decodeDoubleForKey:kOrderResultListCommodityId];
    self.orderTime = [aDecoder decodeObjectForKey:kOrderResultListOrderTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commoditySerial forKey:kOrderResultListCommoditySerial];
    [aCoder encodeDouble:_orderSerial forKey:kOrderResultListOrderSerial];
    [aCoder encodeDouble:_orderAmount forKey:kOrderResultListOrderAmount];
    [aCoder encodeObject:_commodityName forKey:kOrderResultListCommodityName];
    [aCoder encodeObject:_equipmentAddress forKey:kOrderResultListEquipmentAddress];
    [aCoder encodeDouble:_orderState forKey:kOrderResultListOrderState];
    [aCoder encodeDouble:_commodityId forKey:kOrderResultListCommodityId];
    [aCoder encodeObject:_orderTime forKey:kOrderResultListOrderTime];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderResultList *copy = [[OrderResultList alloc] init];
    
    
    
    if (copy) {

        copy.commoditySerial = self.commoditySerial;
        copy.orderSerial = self.orderSerial;
        copy.orderAmount = self.orderAmount;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.equipmentAddress = [self.equipmentAddress copyWithZone:zone];
        copy.orderState = self.orderState;
        copy.commodityId = self.commodityId;
        copy.orderTime = [self.orderTime copyWithZone:zone];
    }
    
    return copy;
}


@end
