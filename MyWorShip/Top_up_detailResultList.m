//
//  Top_up_detailResultList.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Top_up_detailResultList.h"


NSString *const kTop_up_detailResultListRechargeType = @"recharge_type";
NSString *const kTop_up_detailResultListRechargeDescribe = @"recharge_describe";
NSString *const kTop_up_detailResultListRemark = @"remark";
NSString *const kTop_up_detailResultListRechargeState = @"recharge_state";
NSString *const kTop_up_detailResultListRechargeSerial = @"recharge_serial";
NSString *const kTop_up_detailResultListBaseUuid = @"base_uuid";
NSString *const kTop_up_detailResultListRechargeAmount = @"recharge_amount";
NSString *const kTop_up_detailResultListRechargeTime = @"recharge_time";


@interface Top_up_detailResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Top_up_detailResultList

@synthesize rechargeType = _rechargeType;
@synthesize rechargeDescribe = _rechargeDescribe;
@synthesize remark = _remark;
@synthesize rechargeState = _rechargeState;
@synthesize rechargeSerial = _rechargeSerial;
@synthesize baseUuid = _baseUuid;
@synthesize rechargeAmount = _rechargeAmount;
@synthesize rechargeTime = _rechargeTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.rechargeType = [[self objectOrNilForKey:kTop_up_detailResultListRechargeType fromDictionary:dict] doubleValue];
            self.rechargeDescribe = [self objectOrNilForKey:kTop_up_detailResultListRechargeDescribe fromDictionary:dict];
            self.remark = [self objectOrNilForKey:kTop_up_detailResultListRemark fromDictionary:dict];
            self.rechargeState = [[self objectOrNilForKey:kTop_up_detailResultListRechargeState fromDictionary:dict] doubleValue];
            self.rechargeSerial = [self objectOrNilForKey:kTop_up_detailResultListRechargeSerial fromDictionary:dict];
            self.baseUuid = [[self objectOrNilForKey:kTop_up_detailResultListBaseUuid fromDictionary:dict] doubleValue];
            self.rechargeAmount = [[self objectOrNilForKey:kTop_up_detailResultListRechargeAmount fromDictionary:dict] doubleValue];
            self.rechargeTime = [self objectOrNilForKey:kTop_up_detailResultListRechargeTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rechargeType] forKey:kTop_up_detailResultListRechargeType];
    [mutableDict setValue:self.rechargeDescribe forKey:kTop_up_detailResultListRechargeDescribe];
    [mutableDict setValue:self.remark forKey:kTop_up_detailResultListRemark];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rechargeState] forKey:kTop_up_detailResultListRechargeState];
    [mutableDict setValue:self.rechargeSerial forKey:kTop_up_detailResultListRechargeSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kTop_up_detailResultListBaseUuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rechargeAmount] forKey:kTop_up_detailResultListRechargeAmount];
    [mutableDict setValue:self.rechargeTime forKey:kTop_up_detailResultListRechargeTime];

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

    self.rechargeType = [aDecoder decodeDoubleForKey:kTop_up_detailResultListRechargeType];
    self.rechargeDescribe = [aDecoder decodeObjectForKey:kTop_up_detailResultListRechargeDescribe];
    self.remark = [aDecoder decodeObjectForKey:kTop_up_detailResultListRemark];
    self.rechargeState = [aDecoder decodeDoubleForKey:kTop_up_detailResultListRechargeState];
    self.rechargeSerial = [aDecoder decodeObjectForKey:kTop_up_detailResultListRechargeSerial];
    self.baseUuid = [aDecoder decodeDoubleForKey:kTop_up_detailResultListBaseUuid];
    self.rechargeAmount = [aDecoder decodeDoubleForKey:kTop_up_detailResultListRechargeAmount];
    self.rechargeTime = [aDecoder decodeObjectForKey:kTop_up_detailResultListRechargeTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_rechargeType forKey:kTop_up_detailResultListRechargeType];
    [aCoder encodeObject:_rechargeDescribe forKey:kTop_up_detailResultListRechargeDescribe];
    [aCoder encodeObject:_remark forKey:kTop_up_detailResultListRemark];
    [aCoder encodeDouble:_rechargeState forKey:kTop_up_detailResultListRechargeState];
    [aCoder encodeObject:_rechargeSerial forKey:kTop_up_detailResultListRechargeSerial];
    [aCoder encodeDouble:_baseUuid forKey:kTop_up_detailResultListBaseUuid];
    [aCoder encodeDouble:_rechargeAmount forKey:kTop_up_detailResultListRechargeAmount];
    [aCoder encodeObject:_rechargeTime forKey:kTop_up_detailResultListRechargeTime];
}

- (id)copyWithZone:(NSZone *)zone {
    Top_up_detailResultList *copy = [[Top_up_detailResultList alloc] init];
    
    
    
    if (copy) {

        copy.rechargeType = self.rechargeType;
        copy.rechargeDescribe = [self.rechargeDescribe copyWithZone:zone];
        copy.remark = [self.remark copyWithZone:zone];
        copy.rechargeState = self.rechargeState;
        copy.rechargeSerial = [self.rechargeSerial copyWithZone:zone];
        copy.baseUuid = self.baseUuid;
        copy.rechargeAmount = self.rechargeAmount;
        copy.rechargeTime = [self.rechargeTime copyWithZone:zone];
    }
    
    return copy;
}


@end
