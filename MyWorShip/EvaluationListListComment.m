//
//  EvaluationListListComment.m
//
//  Created by   on 2017/6/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "EvaluationListListComment.h"
#import "EvaluationListResultList.h"


NSString *const kEvaluationListListCommentCurrPage = @"currPage";
NSString *const kEvaluationListListCommentTotalRecode = @"totalRecode";
NSString *const kEvaluationListListCommentPageSize = @"pageSize";
NSString *const kEvaluationListListCommentTotalPage = @"totalPage";
NSString *const kEvaluationListListCommentResultList = @"resultList";


@interface EvaluationListListComment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EvaluationListListComment

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
            self.currPage = [[self objectOrNilForKey:kEvaluationListListCommentCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kEvaluationListListCommentTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kEvaluationListListCommentPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kEvaluationListListCommentTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedEvaluationListResultList = [dict objectForKey:kEvaluationListListCommentResultList];
    NSMutableArray *parsedEvaluationListResultList = [NSMutableArray array];
    
    if ([receivedEvaluationListResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedEvaluationListResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedEvaluationListResultList addObject:[EvaluationListResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedEvaluationListResultList isKindOfClass:[NSDictionary class]]) {
       [parsedEvaluationListResultList addObject:[EvaluationListResultList modelObjectWithDictionary:(NSDictionary *)receivedEvaluationListResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedEvaluationListResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kEvaluationListListCommentCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kEvaluationListListCommentTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kEvaluationListListCommentPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kEvaluationListListCommentTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kEvaluationListListCommentResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kEvaluationListListCommentCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kEvaluationListListCommentTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kEvaluationListListCommentPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kEvaluationListListCommentTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kEvaluationListListCommentResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kEvaluationListListCommentCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kEvaluationListListCommentTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kEvaluationListListCommentPageSize];
    [aCoder encodeDouble:_totalPage forKey:kEvaluationListListCommentTotalPage];
    [aCoder encodeObject:_resultList forKey:kEvaluationListListCommentResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    EvaluationListListComment *copy = [[EvaluationListListComment alloc] init];
    
    
    
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
