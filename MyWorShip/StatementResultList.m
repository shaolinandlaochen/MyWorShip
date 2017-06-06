//
//  StatementResultList.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "StatementResultList.h"


NSString *const kStatementResultListCwalletRemain = @"cwallet_remain";
NSString *const kStatementResultListCwalletAmount = @"cwallet_amount";
NSString *const kStatementResultListCwalletTime = @"cwallet_time";
NSString *const kStatementResultListId = @"id";
NSString *const kStatementResultListRemark = @"remark";
NSString *const kStatementResultListBaseUuid = @"base_uuid";
NSString *const kStatementResultListCwalletType = @"cwallet_type";


@interface StatementResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StatementResultList

@synthesize cwalletRemain = _cwalletRemain;
@synthesize cwalletAmount = _cwalletAmount;
@synthesize cwalletTime = _cwalletTime;
@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize remark = _remark;
@synthesize baseUuid = _baseUuid;
@synthesize cwalletType = _cwalletType;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cwalletRemain = [[self objectOrNilForKey:kStatementResultListCwalletRemain fromDictionary:dict] doubleValue];
            self.cwalletAmount = [[self objectOrNilForKey:kStatementResultListCwalletAmount fromDictionary:dict] doubleValue];
            self.cwalletTime = [self objectOrNilForKey:kStatementResultListCwalletTime fromDictionary:dict];
            self.resultListIdentifier = [[self objectOrNilForKey:kStatementResultListId fromDictionary:dict] doubleValue];
            self.remark = [self objectOrNilForKey:kStatementResultListRemark fromDictionary:dict];
            self.baseUuid = [[self objectOrNilForKey:kStatementResultListBaseUuid fromDictionary:dict] doubleValue];
            self.cwalletType = [self objectOrNilForKey:kStatementResultListCwalletType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cwalletRemain] forKey:kStatementResultListCwalletRemain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cwalletAmount] forKey:kStatementResultListCwalletAmount];
    [mutableDict setValue:self.cwalletTime forKey:kStatementResultListCwalletTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kStatementResultListId];
    [mutableDict setValue:self.remark forKey:kStatementResultListRemark];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kStatementResultListBaseUuid];
    [mutableDict setValue:self.cwalletType forKey:kStatementResultListCwalletType];

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

    self.cwalletRemain = [aDecoder decodeDoubleForKey:kStatementResultListCwalletRemain];
    self.cwalletAmount = [aDecoder decodeDoubleForKey:kStatementResultListCwalletAmount];
    self.cwalletTime = [aDecoder decodeObjectForKey:kStatementResultListCwalletTime];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kStatementResultListId];
    self.remark = [aDecoder decodeObjectForKey:kStatementResultListRemark];
    self.baseUuid = [aDecoder decodeDoubleForKey:kStatementResultListBaseUuid];
    self.cwalletType = [aDecoder decodeObjectForKey:kStatementResultListCwalletType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cwalletRemain forKey:kStatementResultListCwalletRemain];
    [aCoder encodeDouble:_cwalletAmount forKey:kStatementResultListCwalletAmount];
    [aCoder encodeObject:_cwalletTime forKey:kStatementResultListCwalletTime];
    [aCoder encodeDouble:_resultListIdentifier forKey:kStatementResultListId];
    [aCoder encodeObject:_remark forKey:kStatementResultListRemark];
    [aCoder encodeDouble:_baseUuid forKey:kStatementResultListBaseUuid];
    [aCoder encodeObject:_cwalletType forKey:kStatementResultListCwalletType];
}

- (id)copyWithZone:(NSZone *)zone {
    StatementResultList *copy = [[StatementResultList alloc] init];
    
    
    
    if (copy) {

        copy.cwalletRemain = self.cwalletRemain;
        copy.cwalletAmount = self.cwalletAmount;
        copy.cwalletTime = [self.cwalletTime copyWithZone:zone];
        copy.resultListIdentifier = self.resultListIdentifier;
        copy.remark = [self.remark copyWithZone:zone];
        copy.baseUuid = self.baseUuid;
        copy.cwalletType = [self.cwalletType copyWithZone:zone];
    }
    
    return copy;
}


@end
