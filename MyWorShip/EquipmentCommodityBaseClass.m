//
//  EquipmentCommodityBaseClass.m
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "EquipmentCommodityBaseClass.h"
#import "EquipmentCommodityPagingList.h"


NSString *const kEquipmentCommodityBaseClassCode = @"code";
NSString *const kEquipmentCommodityBaseClassImgSrc = @"imgSrc";
NSString *const kEquipmentCommodityBaseClassMsg = @"msg";
NSString *const kEquipmentCommodityBaseClassPagingList = @"pagingList";


@interface EquipmentCommodityBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EquipmentCommodityBaseClass

@synthesize code = _code;
@synthesize imgSrc = _imgSrc;
@synthesize msg = _msg;
@synthesize pagingList = _pagingList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kEquipmentCommodityBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kEquipmentCommodityBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kEquipmentCommodityBaseClassMsg fromDictionary:dict];
            self.pagingList = [EquipmentCommodityPagingList modelObjectWithDictionary:[dict objectForKey:kEquipmentCommodityBaseClassPagingList]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kEquipmentCommodityBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kEquipmentCommodityBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kEquipmentCommodityBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kEquipmentCommodityBaseClassPagingList];

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

    self.code = [aDecoder decodeObjectForKey:kEquipmentCommodityBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kEquipmentCommodityBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kEquipmentCommodityBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kEquipmentCommodityBaseClassPagingList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kEquipmentCommodityBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kEquipmentCommodityBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kEquipmentCommodityBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kEquipmentCommodityBaseClassPagingList];
}

- (id)copyWithZone:(NSZone *)zone {
    EquipmentCommodityBaseClass *copy = [[EquipmentCommodityBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.pagingList = [self.pagingList copyWithZone:zone];
    }
    
    return copy;
}


@end
