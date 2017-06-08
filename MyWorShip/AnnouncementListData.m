//
//  AnnouncementListData.m
//
//  Created by   on 2017/6/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AnnouncementListData.h"
#import "AnnouncementListResultList.h"


NSString *const kAnnouncementListDataCurrPage = @"currPage";
NSString *const kAnnouncementListDataTotalRecode = @"totalRecode";
NSString *const kAnnouncementListDataPageSize = @"pageSize";
NSString *const kAnnouncementListDataTotalPage = @"totalPage";
NSString *const kAnnouncementListDataResultList = @"resultList";


@interface AnnouncementListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AnnouncementListData

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
            self.currPage = [[self objectOrNilForKey:kAnnouncementListDataCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kAnnouncementListDataTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kAnnouncementListDataPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kAnnouncementListDataTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedAnnouncementListResultList = [dict objectForKey:kAnnouncementListDataResultList];
    NSMutableArray *parsedAnnouncementListResultList = [NSMutableArray array];
    
    if ([receivedAnnouncementListResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAnnouncementListResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAnnouncementListResultList addObject:[AnnouncementListResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAnnouncementListResultList isKindOfClass:[NSDictionary class]]) {
       [parsedAnnouncementListResultList addObject:[AnnouncementListResultList modelObjectWithDictionary:(NSDictionary *)receivedAnnouncementListResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedAnnouncementListResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kAnnouncementListDataCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kAnnouncementListDataTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kAnnouncementListDataPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kAnnouncementListDataTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kAnnouncementListDataResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kAnnouncementListDataCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kAnnouncementListDataTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kAnnouncementListDataPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kAnnouncementListDataTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kAnnouncementListDataResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kAnnouncementListDataCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kAnnouncementListDataTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kAnnouncementListDataPageSize];
    [aCoder encodeDouble:_totalPage forKey:kAnnouncementListDataTotalPage];
    [aCoder encodeObject:_resultList forKey:kAnnouncementListDataResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    AnnouncementListData *copy = [[AnnouncementListData alloc] init];
    
    
    
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
