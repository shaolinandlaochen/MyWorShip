//
//  Top_up_detailBaseClass.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Top_up_detailBaseClass.h"
#import "Top_up_detailPagingList.h"


NSString *const kTop_up_detailBaseClassCode = @"code";
NSString *const kTop_up_detailBaseClassEnd = @"end";
NSString *const kTop_up_detailBaseClassMsg = @"msg";
NSString *const kTop_up_detailBaseClassPagingList = @"pagingList";
NSString *const kTop_up_detailBaseClassStart = @"start";


@interface Top_up_detailBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Top_up_detailBaseClass

@synthesize code = _code;
@synthesize endProperty = _endProperty;
@synthesize msg = _msg;
@synthesize pagingList = _pagingList;
@synthesize start = _start;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kTop_up_detailBaseClassCode fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kTop_up_detailBaseClassEnd fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kTop_up_detailBaseClassMsg fromDictionary:dict];
            self.pagingList = [Top_up_detailPagingList modelObjectWithDictionary:[dict objectForKey:kTop_up_detailBaseClassPagingList]];
            self.start = [self objectOrNilForKey:kTop_up_detailBaseClassStart fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kTop_up_detailBaseClassCode];
    [mutableDict setValue:self.endProperty forKey:kTop_up_detailBaseClassEnd];
    [mutableDict setValue:self.msg forKey:kTop_up_detailBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kTop_up_detailBaseClassPagingList];
    [mutableDict setValue:self.start forKey:kTop_up_detailBaseClassStart];

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

    self.code = [aDecoder decodeObjectForKey:kTop_up_detailBaseClassCode];
    self.endProperty = [aDecoder decodeObjectForKey:kTop_up_detailBaseClassEnd];
    self.msg = [aDecoder decodeObjectForKey:kTop_up_detailBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kTop_up_detailBaseClassPagingList];
    self.start = [aDecoder decodeObjectForKey:kTop_up_detailBaseClassStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kTop_up_detailBaseClassCode];
    [aCoder encodeObject:_endProperty forKey:kTop_up_detailBaseClassEnd];
    [aCoder encodeObject:_msg forKey:kTop_up_detailBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kTop_up_detailBaseClassPagingList];
    [aCoder encodeObject:_start forKey:kTop_up_detailBaseClassStart];
}

- (id)copyWithZone:(NSZone *)zone {
    Top_up_detailBaseClass *copy = [[Top_up_detailBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.pagingList = [self.pagingList copyWithZone:zone];
        copy.start = [self.start copyWithZone:zone];
    }
    
    return copy;
}


@end
