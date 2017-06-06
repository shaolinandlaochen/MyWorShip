//
//  StatementBaseClass.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "StatementBaseClass.h"
#import "StatementPagingList.h"


NSString *const kStatementBaseClassCode = @"code";
NSString *const kStatementBaseClassEnd = @"end";
NSString *const kStatementBaseClassMsg = @"msg";
NSString *const kStatementBaseClassPagingList = @"pagingList";
NSString *const kStatementBaseClassStart = @"start";


@interface StatementBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StatementBaseClass

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
            self.code = [self objectOrNilForKey:kStatementBaseClassCode fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kStatementBaseClassEnd fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kStatementBaseClassMsg fromDictionary:dict];
            self.pagingList = [StatementPagingList modelObjectWithDictionary:[dict objectForKey:kStatementBaseClassPagingList]];
            self.start = [self objectOrNilForKey:kStatementBaseClassStart fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kStatementBaseClassCode];
    [mutableDict setValue:self.endProperty forKey:kStatementBaseClassEnd];
    [mutableDict setValue:self.msg forKey:kStatementBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kStatementBaseClassPagingList];
    [mutableDict setValue:self.start forKey:kStatementBaseClassStart];

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

    self.code = [aDecoder decodeObjectForKey:kStatementBaseClassCode];
    self.endProperty = [aDecoder decodeObjectForKey:kStatementBaseClassEnd];
    self.msg = [aDecoder decodeObjectForKey:kStatementBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kStatementBaseClassPagingList];
    self.start = [aDecoder decodeObjectForKey:kStatementBaseClassStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kStatementBaseClassCode];
    [aCoder encodeObject:_endProperty forKey:kStatementBaseClassEnd];
    [aCoder encodeObject:_msg forKey:kStatementBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kStatementBaseClassPagingList];
    [aCoder encodeObject:_start forKey:kStatementBaseClassStart];
}

- (id)copyWithZone:(NSZone *)zone {
    StatementBaseClass *copy = [[StatementBaseClass alloc] init];
    
    
    
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
