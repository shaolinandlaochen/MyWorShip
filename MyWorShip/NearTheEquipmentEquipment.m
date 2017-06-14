//
//  NearTheEquipmentEquipment.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "NearTheEquipmentEquipment.h"


NSString *const kNearTheEquipmentEquipmentEquipmentLongitude = @"equipment_longitude";
NSString *const kNearTheEquipmentEquipmentEquipmentState = @"equipment_state";
NSString *const kNearTheEquipmentEquipmentEquipmentAddress = @"equipment_address";
NSString *const kNearTheEquipmentEquipmentEquipmentLatitude = @"equipment_latitude";
NSString *const kNearTheEquipmentEquipmentEquipmentName = @"equipment_name";
NSString *const kNearTheEquipmentEquipmentEquipmentUuid = @"equipment_uuid";


@interface NearTheEquipmentEquipment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NearTheEquipmentEquipment

@synthesize equipmentLongitude = _equipmentLongitude;
@synthesize equipmentState = _equipmentState;
@synthesize equipmentAddress = _equipmentAddress;
@synthesize equipmentLatitude = _equipmentLatitude;
@synthesize equipmentName = _equipmentName;
@synthesize equipmentUuid = _equipmentUuid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.equipmentLongitude = [self objectOrNilForKey:kNearTheEquipmentEquipmentEquipmentLongitude fromDictionary:dict];
            self.equipmentState = [[self objectOrNilForKey:kNearTheEquipmentEquipmentEquipmentState fromDictionary:dict] doubleValue];
            self.equipmentAddress = [self objectOrNilForKey:kNearTheEquipmentEquipmentEquipmentAddress fromDictionary:dict];
            self.equipmentLatitude = [self objectOrNilForKey:kNearTheEquipmentEquipmentEquipmentLatitude fromDictionary:dict];
            self.equipmentName = [self objectOrNilForKey:kNearTheEquipmentEquipmentEquipmentName fromDictionary:dict];
            self.equipmentUuid = [[self objectOrNilForKey:kNearTheEquipmentEquipmentEquipmentUuid fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.equipmentLongitude forKey:kNearTheEquipmentEquipmentEquipmentLongitude];
    [mutableDict setValue:[NSNumber numberWithDouble:self.equipmentState] forKey:kNearTheEquipmentEquipmentEquipmentState];
    [mutableDict setValue:self.equipmentAddress forKey:kNearTheEquipmentEquipmentEquipmentAddress];
    [mutableDict setValue:self.equipmentLatitude forKey:kNearTheEquipmentEquipmentEquipmentLatitude];
    [mutableDict setValue:self.equipmentName forKey:kNearTheEquipmentEquipmentEquipmentName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.equipmentUuid] forKey:kNearTheEquipmentEquipmentEquipmentUuid];

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

    self.equipmentLongitude = [aDecoder decodeObjectForKey:kNearTheEquipmentEquipmentEquipmentLongitude];
    self.equipmentState = [aDecoder decodeDoubleForKey:kNearTheEquipmentEquipmentEquipmentState];
    self.equipmentAddress = [aDecoder decodeObjectForKey:kNearTheEquipmentEquipmentEquipmentAddress];
    self.equipmentLatitude = [aDecoder decodeObjectForKey:kNearTheEquipmentEquipmentEquipmentLatitude];
    self.equipmentName = [aDecoder decodeObjectForKey:kNearTheEquipmentEquipmentEquipmentName];
    self.equipmentUuid = [aDecoder decodeDoubleForKey:kNearTheEquipmentEquipmentEquipmentUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_equipmentLongitude forKey:kNearTheEquipmentEquipmentEquipmentLongitude];
    [aCoder encodeDouble:_equipmentState forKey:kNearTheEquipmentEquipmentEquipmentState];
    [aCoder encodeObject:_equipmentAddress forKey:kNearTheEquipmentEquipmentEquipmentAddress];
    [aCoder encodeObject:_equipmentLatitude forKey:kNearTheEquipmentEquipmentEquipmentLatitude];
    [aCoder encodeObject:_equipmentName forKey:kNearTheEquipmentEquipmentEquipmentName];
    [aCoder encodeDouble:_equipmentUuid forKey:kNearTheEquipmentEquipmentEquipmentUuid];
}

- (id)copyWithZone:(NSZone *)zone {
    NearTheEquipmentEquipment *copy = [[NearTheEquipmentEquipment alloc] init];
    
    
    
    if (copy) {

        copy.equipmentLongitude = [self.equipmentLongitude copyWithZone:zone];
        copy.equipmentState = self.equipmentState;
        copy.equipmentAddress = [self.equipmentAddress copyWithZone:zone];
        copy.equipmentLatitude = [self.equipmentLatitude copyWithZone:zone];
        copy.equipmentName = [self.equipmentName copyWithZone:zone];
        copy.equipmentUuid = self.equipmentUuid;
    }
    
    return copy;
}


@end
