//
//  VIPPagingList.m
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "VIPPagingList.h"
#import "VIPResultList.h"


NSString *const kVIPPagingListCurrPage = @"currPage";
NSString *const kVIPPagingListTotalRecode = @"totalRecode";
NSString *const kVIPPagingListPageSize = @"pageSize";
NSString *const kVIPPagingListTotalPage = @"totalPage";
NSString *const kVIPPagingListResultList = @"resultList";


@interface VIPPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VIPPagingList

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
            self.currPage = [[self objectOrNilForKey:kVIPPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kVIPPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kVIPPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kVIPPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedVIPResultList = [dict objectForKey:kVIPPagingListResultList];
    NSMutableArray *parsedVIPResultList = [NSMutableArray array];
    
    if ([receivedVIPResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVIPResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVIPResultList addObject:[VIPResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVIPResultList isKindOfClass:[NSDictionary class]]) {
       [parsedVIPResultList addObject:[VIPResultList modelObjectWithDictionary:(NSDictionary *)receivedVIPResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedVIPResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kVIPPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kVIPPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kVIPPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kVIPPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kVIPPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kVIPPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kVIPPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kVIPPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kVIPPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kVIPPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kVIPPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kVIPPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kVIPPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kVIPPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kVIPPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    VIPPagingList *copy = [[VIPPagingList alloc] init];
    
    
    
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
