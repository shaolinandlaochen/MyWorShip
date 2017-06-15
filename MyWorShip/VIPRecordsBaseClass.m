//
//  VIPRecordsBaseClass.m
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "VIPRecordsBaseClass.h"
#import "VIPRecordsPagingList.h"


NSString *const kVIPRecordsBaseClassMsg = @"msg";
NSString *const kVIPRecordsBaseClassCode = @"code";
NSString *const kVIPRecordsBaseClassPagingList = @"pagingList";


@interface VIPRecordsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VIPRecordsBaseClass

@synthesize msg = _msg;
@synthesize code = _code;
@synthesize pagingList = _pagingList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kVIPRecordsBaseClassMsg fromDictionary:dict];
            self.code = [self objectOrNilForKey:kVIPRecordsBaseClassCode fromDictionary:dict];
            self.pagingList = [VIPRecordsPagingList modelObjectWithDictionary:[dict objectForKey:kVIPRecordsBaseClassPagingList]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kVIPRecordsBaseClassMsg];
    [mutableDict setValue:self.code forKey:kVIPRecordsBaseClassCode];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kVIPRecordsBaseClassPagingList];

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

    self.msg = [aDecoder decodeObjectForKey:kVIPRecordsBaseClassMsg];
    self.code = [aDecoder decodeObjectForKey:kVIPRecordsBaseClassCode];
    self.pagingList = [aDecoder decodeObjectForKey:kVIPRecordsBaseClassPagingList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kVIPRecordsBaseClassMsg];
    [aCoder encodeObject:_code forKey:kVIPRecordsBaseClassCode];
    [aCoder encodeObject:_pagingList forKey:kVIPRecordsBaseClassPagingList];
}

- (id)copyWithZone:(NSZone *)zone {
    VIPRecordsBaseClass *copy = [[VIPRecordsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.pagingList = [self.pagingList copyWithZone:zone];
    }
    
    return copy;
}


@end
