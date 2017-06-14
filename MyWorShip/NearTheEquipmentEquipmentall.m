//
//  NearTheEquipmentEquipmentall.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "NearTheEquipmentEquipmentall.h"


NSString *const kNearTheEquipmentEquipmentallEquipmentAddress = @"equipment_address";
NSString *const kNearTheEquipmentEquipmentallEquipmentState = @"equipment_state";
NSString *const kNearTheEquipmentEquipmentallEquipmentUuid = @"equipment_uuid";
NSString *const kNearTheEquipmentEquipmentallEquipmentLatitude = @"equipment_latitude";
NSString *const kNearTheEquipmentEquipmentallEquipmentName = @"equipment_name";
NSString *const kNearTheEquipmentEquipmentallEquipmentLongitude = @"equipment_longitude";


@interface NearTheEquipmentEquipmentall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NearTheEquipmentEquipmentall

@synthesize equipmentAddress = _equipmentAddress;
@synthesize equipmentState = _equipmentState;
@synthesize equipmentUuid = _equipmentUuid;
@synthesize equipmentLatitude = _equipmentLatitude;
@synthesize equipmentName = _equipmentName;
@synthesize equipmentLongitude = _equipmentLongitude;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.equipmentAddress = [self objectOrNilForKey:kNearTheEquipmentEquipmentallEquipmentAddress fromDictionary:dict];
            self.equipmentState = [[self objectOrNilForKey:kNearTheEquipmentEquipmentallEquipmentState fromDictionary:dict] doubleValue];
            self.equipmentUuid = [[self objectOrNilForKey:kNearTheEquipmentEquipmentallEquipmentUuid fromDictionary:dict] doubleValue];
            self.equipmentLatitude = [self objectOrNilForKey:kNearTheEquipmentEquipmentallEquipmentLatitude fromDictionary:dict];
            self.equipmentName = [self objectOrNilForKey:kNearTheEquipmentEquipmentallEquipmentName fromDictionary:dict];
            self.equipmentLongitude = [self objectOrNilForKey:kNearTheEquipmentEquipmentallEquipmentLongitude fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.equipmentAddress forKey:kNearTheEquipmentEquipmentallEquipmentAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.equipmentState] forKey:kNearTheEquipmentEquipmentallEquipmentState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.equipmentUuid] forKey:kNearTheEquipmentEquipmentallEquipmentUuid];
    [mutableDict setValue:self.equipmentLatitude forKey:kNearTheEquipmentEquipmentallEquipmentLatitude];
    [mutableDict setValue:self.equipmentName forKey:kNearTheEquipmentEquipmentallEquipmentName];
    [mutableDict setValue:self.equipmentLongitude forKey:kNearTheEquipmentEquipmentallEquipmentLongitude];

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

    self.equipmentAddress = [aDecoder decodeObjectForKey:kNearTheEquipmentEquipmentallEquipmentAddress];
    self.equipmentState = [aDecoder decodeDoubleForKey:kNearTheEquipmentEquipmentallEquipmentState];
    self.equipmentUuid = [aDecoder decodeDoubleForKey:kNearTheEquipmentEquipmentallEquipmentUuid];
    self.equipmentLatitude = [aDecoder decodeObjectForKey:kNearTheEquipmentEquipmentallEquipmentLatitude];
    self.equipmentName = [aDecoder decodeObjectForKey:kNearTheEquipmentEquipmentallEquipmentName];
    self.equipmentLongitude = [aDecoder decodeObjectForKey:kNearTheEquipmentEquipmentallEquipmentLongitude];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_equipmentAddress forKey:kNearTheEquipmentEquipmentallEquipmentAddress];
    [aCoder encodeDouble:_equipmentState forKey:kNearTheEquipmentEquipmentallEquipmentState];
    [aCoder encodeDouble:_equipmentUuid forKey:kNearTheEquipmentEquipmentallEquipmentUuid];
    [aCoder encodeObject:_equipmentLatitude forKey:kNearTheEquipmentEquipmentallEquipmentLatitude];
    [aCoder encodeObject:_equipmentName forKey:kNearTheEquipmentEquipmentallEquipmentName];
    [aCoder encodeObject:_equipmentLongitude forKey:kNearTheEquipmentEquipmentallEquipmentLongitude];
}

- (id)copyWithZone:(NSZone *)zone {
    NearTheEquipmentEquipmentall *copy = [[NearTheEquipmentEquipmentall alloc] init];
    
    
    
    if (copy) {

        copy.equipmentAddress = [self.equipmentAddress copyWithZone:zone];
        copy.equipmentState = self.equipmentState;
        copy.equipmentUuid = self.equipmentUuid;
        copy.equipmentLatitude = [self.equipmentLatitude copyWithZone:zone];
        copy.equipmentName = [self.equipmentName copyWithZone:zone];
        copy.equipmentLongitude = [self.equipmentLongitude copyWithZone:zone];
    }
    
    return copy;
}


@end
