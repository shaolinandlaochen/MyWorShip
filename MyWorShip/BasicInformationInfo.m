//
//  BasicInformationInfo.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BasicInformationInfo.h"


NSString *const kBasicInformationInfoId = @"id";
NSString *const kBasicInformationInfoBasePhone = @"base_phone";
NSString *const kBasicInformationInfoBaseState = @"base_state";
NSString *const kBasicInformationInfoBaseRegisterTime = @"base_register_time";
NSString *const kBasicInformationInfoBaseLastloginIp = @"base_lastlogin_ip";
NSString *const kBasicInformationInfoBaseUuid = @"base_uuid";
NSString *const kBasicInformationInfoBaseSex = @"base_sex";
NSString *const kBasicInformationInfoBasePeriodDate = @"base_period_date";
NSString *const kBasicInformationInfoBaseCountry = @"base_country";
NSString *const kBasicInformationInfoBaseVisitCount = @"base_visit_count";
NSString *const kBasicInformationInfoBaseNickname = @"base_nickname";
NSString *const kBasicInformationInfoBaseLastloginTime = @"base_lastlogin_time";
NSString *const kBasicInformationInfoBaseIsVip = @"base_is_vip";


@interface BasicInformationInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BasicInformationInfo

@synthesize infoIdentifier = _infoIdentifier;
@synthesize basePhone = _basePhone;
@synthesize baseState = _baseState;
@synthesize baseRegisterTime = _baseRegisterTime;
@synthesize baseLastloginIp = _baseLastloginIp;
@synthesize baseUuid = _baseUuid;
@synthesize baseSex = _baseSex;
@synthesize basePeriodDate = _basePeriodDate;
@synthesize baseCountry = _baseCountry;
@synthesize baseVisitCount = _baseVisitCount;
@synthesize baseNickname = _baseNickname;
@synthesize baseLastloginTime = _baseLastloginTime;
@synthesize baseIsVip = _baseIsVip;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.infoIdentifier = [[self objectOrNilForKey:kBasicInformationInfoId fromDictionary:dict] doubleValue];
            self.basePhone = [self objectOrNilForKey:kBasicInformationInfoBasePhone fromDictionary:dict];
            self.baseState = [[self objectOrNilForKey:kBasicInformationInfoBaseState fromDictionary:dict] doubleValue];
            self.baseRegisterTime = [[self objectOrNilForKey:kBasicInformationInfoBaseRegisterTime fromDictionary:dict] doubleValue];
            self.baseLastloginIp = [self objectOrNilForKey:kBasicInformationInfoBaseLastloginIp fromDictionary:dict];
            self.baseUuid = [[self objectOrNilForKey:kBasicInformationInfoBaseUuid fromDictionary:dict] doubleValue];
            self.baseSex = [self objectOrNilForKey:kBasicInformationInfoBaseSex fromDictionary:dict];
            self.basePeriodDate = [self objectOrNilForKey:kBasicInformationInfoBasePeriodDate fromDictionary:dict];
            self.baseCountry = [self objectOrNilForKey:kBasicInformationInfoBaseCountry fromDictionary:dict];
            self.baseVisitCount = [[self objectOrNilForKey:kBasicInformationInfoBaseVisitCount fromDictionary:dict] doubleValue];
            self.baseNickname = [self objectOrNilForKey:kBasicInformationInfoBaseNickname fromDictionary:dict];
            self.baseLastloginTime = [self objectOrNilForKey:kBasicInformationInfoBaseLastloginTime fromDictionary:dict];
            self.baseIsVip = [[self objectOrNilForKey:kBasicInformationInfoBaseIsVip fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.infoIdentifier] forKey:kBasicInformationInfoId];
    [mutableDict setValue:self.basePhone forKey:kBasicInformationInfoBasePhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseState] forKey:kBasicInformationInfoBaseState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseRegisterTime] forKey:kBasicInformationInfoBaseRegisterTime];
    [mutableDict setValue:self.baseLastloginIp forKey:kBasicInformationInfoBaseLastloginIp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kBasicInformationInfoBaseUuid];
    [mutableDict setValue:self.baseSex forKey:kBasicInformationInfoBaseSex];
    [mutableDict setValue:self.basePeriodDate forKey:kBasicInformationInfoBasePeriodDate];
    [mutableDict setValue:self.baseCountry forKey:kBasicInformationInfoBaseCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseVisitCount] forKey:kBasicInformationInfoBaseVisitCount];
    [mutableDict setValue:self.baseNickname forKey:kBasicInformationInfoBaseNickname];
    [mutableDict setValue:self.baseLastloginTime forKey:kBasicInformationInfoBaseLastloginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseIsVip] forKey:kBasicInformationInfoBaseIsVip];

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

    self.infoIdentifier = [aDecoder decodeDoubleForKey:kBasicInformationInfoId];
    self.basePhone = [aDecoder decodeObjectForKey:kBasicInformationInfoBasePhone];
    self.baseState = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseState];
    self.baseRegisterTime = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseRegisterTime];
    self.baseLastloginIp = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseLastloginIp];
    self.baseUuid = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseUuid];
    self.baseSex = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseSex];
    self.basePeriodDate = [aDecoder decodeObjectForKey:kBasicInformationInfoBasePeriodDate];
    self.baseCountry = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseCountry];
    self.baseVisitCount = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseVisitCount];
    self.baseNickname = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseNickname];
    self.baseLastloginTime = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseLastloginTime];
    self.baseIsVip = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseIsVip];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_infoIdentifier forKey:kBasicInformationInfoId];
    [aCoder encodeObject:_basePhone forKey:kBasicInformationInfoBasePhone];
    [aCoder encodeDouble:_baseState forKey:kBasicInformationInfoBaseState];
    [aCoder encodeDouble:_baseRegisterTime forKey:kBasicInformationInfoBaseRegisterTime];
    [aCoder encodeObject:_baseLastloginIp forKey:kBasicInformationInfoBaseLastloginIp];
    [aCoder encodeDouble:_baseUuid forKey:kBasicInformationInfoBaseUuid];
    [aCoder encodeObject:_baseSex forKey:kBasicInformationInfoBaseSex];
    [aCoder encodeObject:_basePeriodDate forKey:kBasicInformationInfoBasePeriodDate];
    [aCoder encodeObject:_baseCountry forKey:kBasicInformationInfoBaseCountry];
    [aCoder encodeDouble:_baseVisitCount forKey:kBasicInformationInfoBaseVisitCount];
    [aCoder encodeObject:_baseNickname forKey:kBasicInformationInfoBaseNickname];
    [aCoder encodeObject:_baseLastloginTime forKey:kBasicInformationInfoBaseLastloginTime];
    [aCoder encodeDouble:_baseIsVip forKey:kBasicInformationInfoBaseIsVip];
}

- (id)copyWithZone:(NSZone *)zone {
    BasicInformationInfo *copy = [[BasicInformationInfo alloc] init];
    
    
    
    if (copy) {

        copy.infoIdentifier = self.infoIdentifier;
        copy.basePhone = [self.basePhone copyWithZone:zone];
        copy.baseState = self.baseState;
        copy.baseRegisterTime = self.baseRegisterTime;
        copy.baseLastloginIp = [self.baseLastloginIp copyWithZone:zone];
        copy.baseUuid = self.baseUuid;
        copy.baseSex = [self.baseSex copyWithZone:zone];
        copy.basePeriodDate = [self.basePeriodDate copyWithZone:zone];
        copy.baseCountry = [self.baseCountry copyWithZone:zone];
        copy.baseVisitCount = self.baseVisitCount;
        copy.baseNickname = [self.baseNickname copyWithZone:zone];
        copy.baseLastloginTime = [self.baseLastloginTime copyWithZone:zone];
        copy.baseIsVip = self.baseIsVip;
    }
    
    return copy;
}


@end
