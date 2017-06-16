//
//  OrderPagingList.m
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderPagingList.h"
#import "OrderResultList.h"


NSString *const kOrderPagingListCurrPage = @"currPage";
NSString *const kOrderPagingListTotalRecode = @"totalRecode";
NSString *const kOrderPagingListPageSize = @"pageSize";
NSString *const kOrderPagingListTotalPage = @"totalPage";
NSString *const kOrderPagingListResultList = @"resultList";


@interface OrderPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderPagingList

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
            self.currPage = [[self objectOrNilForKey:kOrderPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kOrderPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kOrderPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kOrderPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedOrderResultList = [dict objectForKey:kOrderPagingListResultList];
    NSMutableArray *parsedOrderResultList = [NSMutableArray array];
    
    if ([receivedOrderResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedOrderResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedOrderResultList addObject:[OrderResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedOrderResultList isKindOfClass:[NSDictionary class]]) {
       [parsedOrderResultList addObject:[OrderResultList modelObjectWithDictionary:(NSDictionary *)receivedOrderResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedOrderResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kOrderPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kOrderPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kOrderPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kOrderPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kOrderPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kOrderPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kOrderPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kOrderPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kOrderPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kOrderPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kOrderPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kOrderPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kOrderPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kOrderPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kOrderPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderPagingList *copy = [[OrderPagingList alloc] init];
    
    
    
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
