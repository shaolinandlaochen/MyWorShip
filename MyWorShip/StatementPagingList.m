//
//  StatementPagingList.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "StatementPagingList.h"
#import "StatementResultList.h"


NSString *const kStatementPagingListCurrPage = @"currPage";
NSString *const kStatementPagingListTotalRecode = @"totalRecode";
NSString *const kStatementPagingListPageSize = @"pageSize";
NSString *const kStatementPagingListTotalPage = @"totalPage";
NSString *const kStatementPagingListResultList = @"resultList";


@interface StatementPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StatementPagingList

@synthesize currPage = _currPage;
@synthesize totalRecode = _totalRecode;
@synthesize pageSize = _pageSize;
@synthesize totalPage = _totalPage;
@synthesize resultList = _resultList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.currPage = [[self objectOrNilForKey:kStatementPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kStatementPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kStatementPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kStatementPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedStatementResultList = [dict objectForKey:kStatementPagingListResultList];
    NSMutableArray *parsedStatementResultList = [NSMutableArray array];
    
    if ([receivedStatementResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedStatementResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedStatementResultList addObject:[StatementResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedStatementResultList isKindOfClass:[NSDictionary class]]) {
       [parsedStatementResultList addObject:[StatementResultList modelObjectWithDictionary:(NSDictionary *)receivedStatementResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedStatementResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kStatementPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kStatementPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kStatementPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kStatementPagingListTotalPage];
    NSMutableArray *tempArrayForResultList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.resultList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResultList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResultList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kStatementPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kStatementPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kStatementPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kStatementPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kStatementPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kStatementPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kStatementPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kStatementPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kStatementPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kStatementPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kStatementPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    StatementPagingList *copy = [[StatementPagingList alloc] init];
    
    
    
    if (copy) {

        copy.currPage = self.currPage;
        copy.totalRecode = self.totalRecode;
        copy.pageSize = self.pageSize;
        copy.totalPage = self.totalPage;
        copy.resultList = [self.resultList copyWithZone:zone];
    }
    
    return copy;
}


@end
