//
//  EquipmentCommodityPagingList.m
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "EquipmentCommodityPagingList.h"
#import "EquipmentCommodityResultList.h"


NSString *const kEquipmentCommodityPagingListCurrPage = @"currPage";
NSString *const kEquipmentCommodityPagingListTotalRecode = @"totalRecode";
NSString *const kEquipmentCommodityPagingListPageSize = @"pageSize";
NSString *const kEquipmentCommodityPagingListTotalPage = @"totalPage";
NSString *const kEquipmentCommodityPagingListResultList = @"resultList";


@interface EquipmentCommodityPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EquipmentCommodityPagingList

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
            self.currPage = [[self objectOrNilForKey:kEquipmentCommodityPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kEquipmentCommodityPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kEquipmentCommodityPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kEquipmentCommodityPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedEquipmentCommodityResultList = [dict objectForKey:kEquipmentCommodityPagingListResultList];
    NSMutableArray *parsedEquipmentCommodityResultList = [NSMutableArray array];
    
    if ([receivedEquipmentCommodityResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedEquipmentCommodityResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedEquipmentCommodityResultList addObject:[EquipmentCommodityResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedEquipmentCommodityResultList isKindOfClass:[NSDictionary class]]) {
       [parsedEquipmentCommodityResultList addObject:[EquipmentCommodityResultList modelObjectWithDictionary:(NSDictionary *)receivedEquipmentCommodityResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedEquipmentCommodityResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kEquipmentCommodityPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kEquipmentCommodityPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kEquipmentCommodityPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kEquipmentCommodityPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kEquipmentCommodityPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kEquipmentCommodityPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kEquipmentCommodityPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kEquipmentCommodityPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kEquipmentCommodityPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kEquipmentCommodityPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kEquipmentCommodityPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kEquipmentCommodityPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kEquipmentCommodityPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kEquipmentCommodityPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kEquipmentCommodityPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    EquipmentCommodityPagingList *copy = [[EquipmentCommodityPagingList alloc] init];
    
    
    
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
