//
//  OrderBaseClass.m
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderBaseClass.h"
#import "OrderPagingList.h"


NSString *const kOrderBaseClassCode = @"code";
NSString *const kOrderBaseClassImgSrc = @"imgSrc";
NSString *const kOrderBaseClassMsg = @"msg";
NSString *const kOrderBaseClassPagingList = @"pagingList";


@interface OrderBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderBaseClass

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
            self.code = [self objectOrNilForKey:kOrderBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kOrderBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kOrderBaseClassMsg fromDictionary:dict];
            self.pagingList = [OrderPagingList modelObjectWithDictionary:[dict objectForKey:kOrderBaseClassPagingList]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kOrderBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kOrderBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kOrderBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kOrderBaseClassPagingList];

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

    self.code = [aDecoder decodeObjectForKey:kOrderBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kOrderBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kOrderBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kOrderBaseClassPagingList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kOrderBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kOrderBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kOrderBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kOrderBaseClassPagingList];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderBaseClass *copy = [[OrderBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.pagingList = [self.pagingList copyWithZone:zone];
    }
    
    return copy;
}


@end
