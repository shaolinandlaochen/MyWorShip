//
//  CouponList.m
//
//  Created by   on 2017/6/23
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CouponList.h"


NSString *const kCouponListCouponType = @"coupon_type";
NSString *const kCouponListCouponGrantTime = @"coupon_grant_time";
NSString *const kCouponListCouponName = @"coupon_name";
NSString *const kCouponListId = @"id";
NSString *const kCouponListCouponState = @"coupon_state";
NSString *const kCouponListCouponFullAmount = @"coupon_full_amount";
NSString *const kCouponListCouponSubtractAmount = @"coupon_subtract_amount";
NSString *const kCouponListCouponUseTime = @"coupon_use_time";
NSString *const kCouponListCouponExpireTime = @"coupon_expire_time";
NSString *const kCouponListCouponDiscount = @"coupon_discount";


@interface CouponList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CouponList

@synthesize couponType = _couponType;
@synthesize couponGrantTime = _couponGrantTime;
@synthesize couponName = _couponName;
@synthesize couponListIdentifier = _couponListIdentifier;
@synthesize couponState = _couponState;
@synthesize couponFullAmount = _couponFullAmount;
@synthesize couponSubtractAmount = _couponSubtractAmount;
@synthesize couponUseTime = _couponUseTime;
@synthesize couponExpireTime = _couponExpireTime;
@synthesize couponDiscount = _couponDiscount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.couponType = [[self objectOrNilForKey:kCouponListCouponType fromDictionary:dict] doubleValue];
            self.couponGrantTime = [[self objectOrNilForKey:kCouponListCouponGrantTime fromDictionary:dict] doubleValue];
            self.couponName = [self objectOrNilForKey:kCouponListCouponName fromDictionary:dict];
            self.couponListIdentifier = [[self objectOrNilForKey:kCouponListId fromDictionary:dict] doubleValue];
            self.couponState = [[self objectOrNilForKey:kCouponListCouponState fromDictionary:dict] doubleValue];
            self.couponFullAmount = [[self objectOrNilForKey:kCouponListCouponFullAmount fromDictionary:dict] doubleValue];
            self.couponSubtractAmount = [[self objectOrNilForKey:kCouponListCouponSubtractAmount fromDictionary:dict] doubleValue];
            self.couponUseTime = [self objectOrNilForKey:kCouponListCouponUseTime fromDictionary:dict];
            self.couponExpireTime = [[self objectOrNilForKey:kCouponListCouponExpireTime fromDictionary:dict] doubleValue];
            self.couponDiscount = [[self objectOrNilForKey:kCouponListCouponDiscount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponType] forKey:kCouponListCouponType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponGrantTime] forKey:kCouponListCouponGrantTime];
    [mutableDict setValue:self.couponName forKey:kCouponListCouponName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponListIdentifier] forKey:kCouponListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponState] forKey:kCouponListCouponState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponFullAmount] forKey:kCouponListCouponFullAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponSubtractAmount] forKey:kCouponListCouponSubtractAmount];
    [mutableDict setValue:self.couponUseTime forKey:kCouponListCouponUseTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponExpireTime] forKey:kCouponListCouponExpireTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponDiscount] forKey:kCouponListCouponDiscount];

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

    self.couponType = [aDecoder decodeDoubleForKey:kCouponListCouponType];
    self.couponGrantTime = [aDecoder decodeDoubleForKey:kCouponListCouponGrantTime];
    self.couponName = [aDecoder decodeObjectForKey:kCouponListCouponName];
    self.couponListIdentifier = [aDecoder decodeDoubleForKey:kCouponListId];
    self.couponState = [aDecoder decodeDoubleForKey:kCouponListCouponState];
    self.couponFullAmount = [aDecoder decodeDoubleForKey:kCouponListCouponFullAmount];
    self.couponSubtractAmount = [aDecoder decodeDoubleForKey:kCouponListCouponSubtractAmount];
    self.couponUseTime = [aDecoder decodeObjectForKey:kCouponListCouponUseTime];
    self.couponExpireTime = [aDecoder decodeDoubleForKey:kCouponListCouponExpireTime];
    self.couponDiscount = [aDecoder decodeDoubleForKey:kCouponListCouponDiscount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_couponType forKey:kCouponListCouponType];
    [aCoder encodeDouble:_couponGrantTime forKey:kCouponListCouponGrantTime];
    [aCoder encodeObject:_couponName forKey:kCouponListCouponName];
    [aCoder encodeDouble:_couponListIdentifier forKey:kCouponListId];
    [aCoder encodeDouble:_couponState forKey:kCouponListCouponState];
    [aCoder encodeDouble:_couponFullAmount forKey:kCouponListCouponFullAmount];
    [aCoder encodeDouble:_couponSubtractAmount forKey:kCouponListCouponSubtractAmount];
    [aCoder encodeObject:_couponUseTime forKey:kCouponListCouponUseTime];
    [aCoder encodeDouble:_couponExpireTime forKey:kCouponListCouponExpireTime];
    [aCoder encodeDouble:_couponDiscount forKey:kCouponListCouponDiscount];
}

- (id)copyWithZone:(NSZone *)zone {
    CouponList *copy = [[CouponList alloc] init];
    
    
    
    if (copy) {

        copy.couponType = self.couponType;
        copy.couponGrantTime = self.couponGrantTime;
        copy.couponName = [self.couponName copyWithZone:zone];
        copy.couponListIdentifier = self.couponListIdentifier;
        copy.couponState = self.couponState;
        copy.couponFullAmount = self.couponFullAmount;
        copy.couponSubtractAmount = self.couponSubtractAmount;
        copy.couponUseTime = [self.couponUseTime copyWithZone:zone];
        copy.couponExpireTime = self.couponExpireTime;
        copy.couponDiscount = self.couponDiscount;
    }
    
    return copy;
}


@end
