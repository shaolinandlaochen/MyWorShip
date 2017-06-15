//
//  VIPRecordsResultList.m
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "VIPRecordsResultList.h"


NSString *const kVIPRecordsResultListVipTime = @"vip_time";
NSString *const kVIPRecordsResultListVipRemain = @"vip_remain";


@interface VIPRecordsResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VIPRecordsResultList

@synthesize vipTime = _vipTime;
@synthesize vipRemain = _vipRemain;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.vipTime = [self objectOrNilForKey:kVIPRecordsResultListVipTime fromDictionary:dict];
            self.vipRemain = [[self objectOrNilForKey:kVIPRecordsResultListVipRemain fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.vipTime forKey:kVIPRecordsResultListVipTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipRemain] forKey:kVIPRecordsResultListVipRemain];

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

    self.vipTime = [aDecoder decodeObjectForKey:kVIPRecordsResultListVipTime];
    self.vipRemain = [aDecoder decodeDoubleForKey:kVIPRecordsResultListVipRemain];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_vipTime forKey:kVIPRecordsResultListVipTime];
    [aCoder encodeDouble:_vipRemain forKey:kVIPRecordsResultListVipRemain];
}

- (id)copyWithZone:(NSZone *)zone {
    VIPRecordsResultList *copy = [[VIPRecordsResultList alloc] init];
    
    
    
    if (copy) {

        copy.vipTime = [self.vipTime copyWithZone:zone];
        copy.vipRemain = self.vipRemain;
    }
    
    return copy;
}


@end
