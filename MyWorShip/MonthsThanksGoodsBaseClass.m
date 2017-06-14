//
//  MonthsThanksGoodsBaseClass.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MonthsThanksGoodsBaseClass.h"
#import "MonthsThanksGoodsPagingList.h"


NSString *const kMonthsThanksGoodsBaseClassCode = @"code";
NSString *const kMonthsThanksGoodsBaseClassImgSrc = @"imgSrc";
NSString *const kMonthsThanksGoodsBaseClassMsg = @"msg";
NSString *const kMonthsThanksGoodsBaseClassPagingList = @"pagingList";


@interface MonthsThanksGoodsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MonthsThanksGoodsBaseClass

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
            self.code = [self objectOrNilForKey:kMonthsThanksGoodsBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kMonthsThanksGoodsBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kMonthsThanksGoodsBaseClassMsg fromDictionary:dict];
            self.pagingList = [MonthsThanksGoodsPagingList modelObjectWithDictionary:[dict objectForKey:kMonthsThanksGoodsBaseClassPagingList]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kMonthsThanksGoodsBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kMonthsThanksGoodsBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kMonthsThanksGoodsBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kMonthsThanksGoodsBaseClassPagingList];

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

    self.code = [aDecoder decodeObjectForKey:kMonthsThanksGoodsBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kMonthsThanksGoodsBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kMonthsThanksGoodsBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kMonthsThanksGoodsBaseClassPagingList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kMonthsThanksGoodsBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kMonthsThanksGoodsBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kMonthsThanksGoodsBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kMonthsThanksGoodsBaseClassPagingList];
}

- (id)copyWithZone:(NSZone *)zone {
    MonthsThanksGoodsBaseClass *copy = [[MonthsThanksGoodsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.pagingList = [self.pagingList copyWithZone:zone];
    }
    
    return copy;
}


@end
