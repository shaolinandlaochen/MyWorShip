//
//  CouponsListPagingList.m
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CouponsListPagingList.h"
#import "CouponsListResultList.h"


NSString *const kCouponsListPagingListCurrPage = @"currPage";
NSString *const kCouponsListPagingListTotalRecode = @"totalRecode";
NSString *const kCouponsListPagingListPageSize = @"pageSize";
NSString *const kCouponsListPagingListTotalPage = @"totalPage";
NSString *const kCouponsListPagingListResultList = @"resultList";


@interface CouponsListPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CouponsListPagingList

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
            self.currPage = [[self objectOrNilForKey:kCouponsListPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kCouponsListPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kCouponsListPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kCouponsListPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedCouponsListResultList = [dict objectForKey:kCouponsListPagingListResultList];
    NSMutableArray *parsedCouponsListResultList = [NSMutableArray array];
    
    if ([receivedCouponsListResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCouponsListResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCouponsListResultList addObject:[CouponsListResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCouponsListResultList isKindOfClass:[NSDictionary class]]) {
       [parsedCouponsListResultList addObject:[CouponsListResultList modelObjectWithDictionary:(NSDictionary *)receivedCouponsListResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedCouponsListResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kCouponsListPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kCouponsListPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kCouponsListPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kCouponsListPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kCouponsListPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kCouponsListPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kCouponsListPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kCouponsListPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kCouponsListPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kCouponsListPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kCouponsListPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kCouponsListPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kCouponsListPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kCouponsListPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kCouponsListPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    CouponsListPagingList *copy = [[CouponsListPagingList alloc] init];
    
    
    
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
