//
//  VIPRecordsPagingList.m
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "VIPRecordsPagingList.h"
#import "VIPRecordsResultList.h"


NSString *const kVIPRecordsPagingListCurrPage = @"currPage";
NSString *const kVIPRecordsPagingListTotalRecode = @"totalRecode";
NSString *const kVIPRecordsPagingListPageSize = @"pageSize";
NSString *const kVIPRecordsPagingListTotalPage = @"totalPage";
NSString *const kVIPRecordsPagingListResultList = @"resultList";


@interface VIPRecordsPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VIPRecordsPagingList

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
            self.currPage = [[self objectOrNilForKey:kVIPRecordsPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kVIPRecordsPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kVIPRecordsPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kVIPRecordsPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedVIPRecordsResultList = [dict objectForKey:kVIPRecordsPagingListResultList];
    NSMutableArray *parsedVIPRecordsResultList = [NSMutableArray array];
    
    if ([receivedVIPRecordsResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVIPRecordsResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVIPRecordsResultList addObject:[VIPRecordsResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVIPRecordsResultList isKindOfClass:[NSDictionary class]]) {
       [parsedVIPRecordsResultList addObject:[VIPRecordsResultList modelObjectWithDictionary:(NSDictionary *)receivedVIPRecordsResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedVIPRecordsResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kVIPRecordsPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kVIPRecordsPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kVIPRecordsPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kVIPRecordsPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kVIPRecordsPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kVIPRecordsPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kVIPRecordsPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kVIPRecordsPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kVIPRecordsPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kVIPRecordsPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kVIPRecordsPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kVIPRecordsPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kVIPRecordsPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kVIPRecordsPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kVIPRecordsPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    VIPRecordsPagingList *copy = [[VIPRecordsPagingList alloc] init];
    
    
    
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
