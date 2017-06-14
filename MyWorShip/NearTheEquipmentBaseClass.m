//
//  NearTheEquipmentBaseClass.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "NearTheEquipmentBaseClass.h"
#import "NearTheEquipmentEquipment.h"


NSString *const kNearTheEquipmentBaseClassMsg = @"msg";
NSString *const kNearTheEquipmentBaseClassEquipment = @"equipment";
NSString *const kNearTheEquipmentBaseClassCode = @"code";


@interface NearTheEquipmentBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NearTheEquipmentBaseClass

@synthesize msg = _msg;
@synthesize equipment = _equipment;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kNearTheEquipmentBaseClassMsg fromDictionary:dict];
    NSObject *receivedNearTheEquipmentEquipment = [dict objectForKey:kNearTheEquipmentBaseClassEquipment];
    NSMutableArray *parsedNearTheEquipmentEquipment = [NSMutableArray array];
    
    if ([receivedNearTheEquipmentEquipment isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNearTheEquipmentEquipment) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNearTheEquipmentEquipment addObject:[NearTheEquipmentEquipment modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNearTheEquipmentEquipment isKindOfClass:[NSDictionary class]]) {
       [parsedNearTheEquipmentEquipment addObject:[NearTheEquipmentEquipment modelObjectWithDictionary:(NSDictionary *)receivedNearTheEquipmentEquipment]];
    }

    self.equipment = [NSArray arrayWithArray:parsedNearTheEquipmentEquipment];
            self.code = [self objectOrNilForKey:kNearTheEquipmentBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kNearTheEquipmentBaseClassMsg];
    NSMutableArray *tempArrayForEquipment = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.equipment) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEquipment addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEquipment addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEquipment] forKey:kNearTheEquipmentBaseClassEquipment];
    [mutableDict setValue:self.code forKey:kNearTheEquipmentBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kNearTheEquipmentBaseClassMsg];
    self.equipment = [aDecoder decodeObjectForKey:kNearTheEquipmentBaseClassEquipment];
    self.code = [aDecoder decodeObjectForKey:kNearTheEquipmentBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kNearTheEquipmentBaseClassMsg];
    [aCoder encodeObject:_equipment forKey:kNearTheEquipmentBaseClassEquipment];
    [aCoder encodeObject:_code forKey:kNearTheEquipmentBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    NearTheEquipmentBaseClass *copy = [[NearTheEquipmentBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.equipment = [self.equipment copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
