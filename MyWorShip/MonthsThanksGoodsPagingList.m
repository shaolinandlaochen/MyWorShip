//
//  MonthsThanksGoodsPagingList.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MonthsThanksGoodsPagingList.h"
#import "MonthsThanksGoodsResultList.h"


NSString *const kMonthsThanksGoodsPagingListCurrPage = @"currPage";
NSString *const kMonthsThanksGoodsPagingListTotalRecode = @"totalRecode";
NSString *const kMonthsThanksGoodsPagingListPageSize = @"pageSize";
NSString *const kMonthsThanksGoodsPagingListTotalPage = @"totalPage";
NSString *const kMonthsThanksGoodsPagingListResultList = @"resultList";


@interface MonthsThanksGoodsPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MonthsThanksGoodsPagingList

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
            self.currPage = [[self objectOrNilForKey:kMonthsThanksGoodsPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kMonthsThanksGoodsPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kMonthsThanksGoodsPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kMonthsThanksGoodsPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedMonthsThanksGoodsResultList = [dict objectForKey:kMonthsThanksGoodsPagingListResultList];
    NSMutableArray *parsedMonthsThanksGoodsResultList = [NSMutableArray array];
    
    if ([receivedMonthsThanksGoodsResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMonthsThanksGoodsResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMonthsThanksGoodsResultList addObject:[MonthsThanksGoodsResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMonthsThanksGoodsResultList isKindOfClass:[NSDictionary class]]) {
       [parsedMonthsThanksGoodsResultList addObject:[MonthsThanksGoodsResultList modelObjectWithDictionary:(NSDictionary *)receivedMonthsThanksGoodsResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedMonthsThanksGoodsResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kMonthsThanksGoodsPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kMonthsThanksGoodsPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kMonthsThanksGoodsPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kMonthsThanksGoodsPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kMonthsThanksGoodsPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kMonthsThanksGoodsPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kMonthsThanksGoodsPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kMonthsThanksGoodsPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kMonthsThanksGoodsPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kMonthsThanksGoodsPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kMonthsThanksGoodsPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kMonthsThanksGoodsPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    MonthsThanksGoodsPagingList *copy = [[MonthsThanksGoodsPagingList alloc] init];
    
    
    
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
