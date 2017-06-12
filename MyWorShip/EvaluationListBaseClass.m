//
//  EvaluationListBaseClass.m
//
//  Created by   on 2017/6/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "EvaluationListBaseClass.h"
#import "EvaluationListListComment.h"


NSString *const kEvaluationListBaseClassCode = @"code";
NSString *const kEvaluationListBaseClassListComment = @"listComment";
NSString *const kEvaluationListBaseClassImgSrc = @"imgSrc";
NSString *const kEvaluationListBaseClassMsg = @"msg";
NSString *const kEvaluationListBaseClassTotalCount = @"totalCount";


@interface EvaluationListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EvaluationListBaseClass

@synthesize code = _code;
@synthesize listComment = _listComment;
@synthesize imgSrc = _imgSrc;
@synthesize msg = _msg;
@synthesize totalCount = _totalCount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kEvaluationListBaseClassCode fromDictionary:dict];
            self.listComment = [EvaluationListListComment modelObjectWithDictionary:[dict objectForKey:kEvaluationListBaseClassListComment]];
            self.imgSrc = [self objectOrNilForKey:kEvaluationListBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kEvaluationListBaseClassMsg fromDictionary:dict];
            self.totalCount = [[self objectOrNilForKey:kEvaluationListBaseClassTotalCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kEvaluationListBaseClassCode];
    [mutableDict setValue:[self.listComment dictionaryRepresentation] forKey:kEvaluationListBaseClassListComment];
    [mutableDict setValue:self.imgSrc forKey:kEvaluationListBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kEvaluationListBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kEvaluationListBaseClassTotalCount];

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

    self.code = [aDecoder decodeObjectForKey:kEvaluationListBaseClassCode];
    self.listComment = [aDecoder decodeObjectForKey:kEvaluationListBaseClassListComment];
    self.imgSrc = [aDecoder decodeObjectForKey:kEvaluationListBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kEvaluationListBaseClassMsg];
    self.totalCount = [aDecoder decodeDoubleForKey:kEvaluationListBaseClassTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kEvaluationListBaseClassCode];
    [aCoder encodeObject:_listComment forKey:kEvaluationListBaseClassListComment];
    [aCoder encodeObject:_imgSrc forKey:kEvaluationListBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kEvaluationListBaseClassMsg];
    [aCoder encodeDouble:_totalCount forKey:kEvaluationListBaseClassTotalCount];
}

- (id)copyWithZone:(NSZone *)zone {
    EvaluationListBaseClass *copy = [[EvaluationListBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.listComment = [self.listComment copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.totalCount = self.totalCount;
    }
    
    return copy;
}


@end
