//
//  CouponsListResultList.m
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CouponsListResultList.h"


NSString *const kCouponsListResultListCouponDiscount = @"coupon_discount";
NSString *const kCouponsListResultListCouponGrantTime = @"coupon_grant_time";
NSString *const kCouponsListResultListCouponName = @"coupon_name";
NSString *const kCouponsListResultListId = @"id";
NSString *const kCouponsListResultListCouponState = @"coupon_state";
NSString *const kCouponsListResultListCouponFullAmount = @"coupon_full_amount";
NSString *const kCouponsListResultListCouponSubtractAmount = @"coupon_subtract_amount";
NSString *const kCouponsListResultListBaseUuid = @"base_uuid";
NSString *const kCouponsListResultListCouponUseTime = @"coupon_use_time";
NSString *const kCouponsListResultListCouponType = @"coupon_type";
NSString *const kCouponsListResultListCouponExpireTime = @"coupon_expire_time";


@interface CouponsListResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CouponsListResultList

@synthesize couponDiscount = _couponDiscount;
@synthesize couponGrantTime = _couponGrantTime;
@synthesize couponName = _couponName;
@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize couponState = _couponState;
@synthesize couponFullAmount = _couponFullAmount;
@synthesize couponSubtractAmount = _couponSubtractAmount;
@synthesize baseUuid = _baseUuid;
@synthesize couponUseTime = _couponUseTime;
@synthesize couponType = _couponType;
@synthesize couponExpireTime = _couponExpireTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.couponDiscount = [[self objectOrNilForKey:kCouponsListResultListCouponDiscount fromDictionary:dict] doubleValue];
            self.couponGrantTime = [self objectOrNilForKey:kCouponsListResultListCouponGrantTime fromDictionary:dict];
            self.couponName = [self objectOrNilForKey:kCouponsListResultListCouponName fromDictionary:dict];
            self.resultListIdentifier = [[self objectOrNilForKey:kCouponsListResultListId fromDictionary:dict] doubleValue];
            self.couponState = [[self objectOrNilForKey:kCouponsListResultListCouponState fromDictionary:dict] doubleValue];
            self.couponFullAmount = [[self objectOrNilForKey:kCouponsListResultListCouponFullAmount fromDictionary:dict] doubleValue];
            self.couponSubtractAmount = [[self objectOrNilForKey:kCouponsListResultListCouponSubtractAmount fromDictionary:dict] doubleValue];
            self.baseUuid = [[self objectOrNilForKey:kCouponsListResultListBaseUuid fromDictionary:dict] doubleValue];
            self.couponUseTime = [self objectOrNilForKey:kCouponsListResultListCouponUseTime fromDictionary:dict];
            self.couponType = [[self objectOrNilForKey:kCouponsListResultListCouponType fromDictionary:dict] doubleValue];
            self.couponExpireTime = [self objectOrNilForKey:kCouponsListResultListCouponExpireTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponDiscount] forKey:kCouponsListResultListCouponDiscount];
    [mutableDict setValue:self.couponGrantTime forKey:kCouponsListResultListCouponGrantTime];
    [mutableDict setValue:self.couponName forKey:kCouponsListResultListCouponName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kCouponsListResultListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponState] forKey:kCouponsListResultListCouponState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponFullAmount] forKey:kCouponsListResultListCouponFullAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponSubtractAmount] forKey:kCouponsListResultListCouponSubtractAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kCouponsListResultListBaseUuid];
    [mutableDict setValue:self.couponUseTime forKey:kCouponsListResultListCouponUseTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponType] forKey:kCouponsListResultListCouponType];
    [mutableDict setValue:self.couponExpireTime forKey:kCouponsListResultListCouponExpireTime];

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

    self.couponDiscount = [aDecoder decodeDoubleForKey:kCouponsListResultListCouponDiscount];
    self.couponGrantTime = [aDecoder decodeObjectForKey:kCouponsListResultListCouponGrantTime];
    self.couponName = [aDecoder decodeObjectForKey:kCouponsListResultListCouponName];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kCouponsListResultListId];
    self.couponState = [aDecoder decodeDoubleForKey:kCouponsListResultListCouponState];
    self.couponFullAmount = [aDecoder decodeDoubleForKey:kCouponsListResultListCouponFullAmount];
    self.couponSubtractAmount = [aDecoder decodeDoubleForKey:kCouponsListResultListCouponSubtractAmount];
    self.baseUuid = [aDecoder decodeDoubleForKey:kCouponsListResultListBaseUuid];
    self.couponUseTime = [aDecoder decodeObjectForKey:kCouponsListResultListCouponUseTime];
    self.couponType = [aDecoder decodeDoubleForKey:kCouponsListResultListCouponType];
    self.couponExpireTime = [aDecoder decodeObjectForKey:kCouponsListResultListCouponExpireTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_couponDiscount forKey:kCouponsListResultListCouponDiscount];
    [aCoder encodeObject:_couponGrantTime forKey:kCouponsListResultListCouponGrantTime];
    [aCoder encodeObject:_couponName forKey:kCouponsListResultListCouponName];
    [aCoder encodeDouble:_resultListIdentifier forKey:kCouponsListResultListId];
    [aCoder encodeDouble:_couponState forKey:kCouponsListResultListCouponState];
    [aCoder encodeDouble:_couponFullAmount forKey:kCouponsListResultListCouponFullAmount];
    [aCoder encodeDouble:_couponSubtractAmount forKey:kCouponsListResultListCouponSubtractAmount];
    [aCoder encodeDouble:_baseUuid forKey:kCouponsListResultListBaseUuid];
    [aCoder encodeObject:_couponUseTime forKey:kCouponsListResultListCouponUseTime];
    [aCoder encodeDouble:_couponType forKey:kCouponsListResultListCouponType];
    [aCoder encodeObject:_couponExpireTime forKey:kCouponsListResultListCouponExpireTime];
}

- (id)copyWithZone:(NSZone *)zone {
    CouponsListResultList *copy = [[CouponsListResultList alloc] init];
    
    
    
    if (copy) {

        copy.couponDiscount = self.couponDiscount;
        copy.couponGrantTime = [self.couponGrantTime copyWithZone:zone];
        copy.couponName = [self.couponName copyWithZone:zone];
        copy.resultListIdentifier = self.resultListIdentifier;
        copy.couponState = self.couponState;
        copy.couponFullAmount = self.couponFullAmount;
        copy.couponSubtractAmount = self.couponSubtractAmount;
        copy.baseUuid = self.baseUuid;
        copy.couponUseTime = [self.couponUseTime copyWithZone:zone];
        copy.couponType = self.couponType;
        copy.couponExpireTime = [self.couponExpireTime copyWithZone:zone];
    }
    
    return copy;
}


@end
