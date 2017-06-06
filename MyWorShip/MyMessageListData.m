//
//  MyMessageListData.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyMessageListData.h"
#import "MyMessageListResultList.h"


NSString *const kMyMessageListDataCurrPage = @"currPage";
NSString *const kMyMessageListDataTotalRecode = @"totalRecode";
NSString *const kMyMessageListDataPageSize = @"pageSize";
NSString *const kMyMessageListDataTotalPage = @"totalPage";
NSString *const kMyMessageListDataResultList = @"resultList";


@interface MyMessageListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyMessageListData

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
            self.currPage = [[self objectOrNilForKey:kMyMessageListDataCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kMyMessageListDataTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kMyMessageListDataPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kMyMessageListDataTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedMyMessageListResultList = [dict objectForKey:kMyMessageListDataResultList];
    NSMutableArray *parsedMyMessageListResultList = [NSMutableArray array];
    
    if ([receivedMyMessageListResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMyMessageListResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMyMessageListResultList addObject:[MyMessageListResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMyMessageListResultList isKindOfClass:[NSDictionary class]]) {
       [parsedMyMessageListResultList addObject:[MyMessageListResultList modelObjectWithDictionary:(NSDictionary *)receivedMyMessageListResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedMyMessageListResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kMyMessageListDataCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kMyMessageListDataTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kMyMessageListDataPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kMyMessageListDataTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kMyMessageListDataResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kMyMessageListDataCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kMyMessageListDataTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kMyMessageListDataPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kMyMessageListDataTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kMyMessageListDataResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kMyMessageListDataCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kMyMessageListDataTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kMyMessageListDataPageSize];
    [aCoder encodeDouble:_totalPage forKey:kMyMessageListDataTotalPage];
    [aCoder encodeObject:_resultList forKey:kMyMessageListDataResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    MyMessageListData *copy = [[MyMessageListData alloc] init];
    
    
    
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
