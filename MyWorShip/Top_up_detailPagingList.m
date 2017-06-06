//
//  Top_up_detailPagingList.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Top_up_detailPagingList.h"
#import "Top_up_detailResultList.h"


NSString *const kTop_up_detailPagingListCurrPage = @"currPage";
NSString *const kTop_up_detailPagingListTotalRecode = @"totalRecode";
NSString *const kTop_up_detailPagingListPageSize = @"pageSize";
NSString *const kTop_up_detailPagingListTotalPage = @"totalPage";
NSString *const kTop_up_detailPagingListResultList = @"resultList";


@interface Top_up_detailPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Top_up_detailPagingList

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
            self.currPage = [[self objectOrNilForKey:kTop_up_detailPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kTop_up_detailPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kTop_up_detailPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kTop_up_detailPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedTop_up_detailResultList = [dict objectForKey:kTop_up_detailPagingListResultList];
    NSMutableArray *parsedTop_up_detailResultList = [NSMutableArray array];
    
    if ([receivedTop_up_detailResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTop_up_detailResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTop_up_detailResultList addObject:[Top_up_detailResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTop_up_detailResultList isKindOfClass:[NSDictionary class]]) {
       [parsedTop_up_detailResultList addObject:[Top_up_detailResultList modelObjectWithDictionary:(NSDictionary *)receivedTop_up_detailResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedTop_up_detailResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kTop_up_detailPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kTop_up_detailPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kTop_up_detailPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kTop_up_detailPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kTop_up_detailPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kTop_up_detailPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kTop_up_detailPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kTop_up_detailPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kTop_up_detailPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kTop_up_detailPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kTop_up_detailPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kTop_up_detailPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kTop_up_detailPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kTop_up_detailPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kTop_up_detailPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    Top_up_detailPagingList *copy = [[Top_up_detailPagingList alloc] init];
    
    
    
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
