//
//  GoodsDetilBaseClass.m
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetilBaseClass.h"
#import "GoodsDetilListComment.h"
#import "GoodsDetilComm.h"


NSString *const kGoodsDetilBaseClassImgSrc = @"imgSrc";
NSString *const kGoodsDetilBaseClassTotalCount = @"totalCount";
NSString *const kGoodsDetilBaseClassListComment = @"listComment";
NSString *const kGoodsDetilBaseClassCode = @"code";
NSString *const kGoodsDetilBaseClassComm = @"comm";
NSString *const kGoodsDetilBaseClassMsg = @"msg";
NSString *const kGoodsDetilBaseClassListPic = @"listPic";


@interface GoodsDetilBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetilBaseClass

@synthesize imgSrc = _imgSrc;
@synthesize totalCount = _totalCount;
@synthesize listComment = _listComment;
@synthesize code = _code;
@synthesize comm = _comm;
@synthesize msg = _msg;
@synthesize listPic = _listPic;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.imgSrc = [self objectOrNilForKey:kGoodsDetilBaseClassImgSrc fromDictionary:dict];
            self.totalCount = [[self objectOrNilForKey:kGoodsDetilBaseClassTotalCount fromDictionary:dict] doubleValue];
    NSObject *receivedGoodsDetilListComment = [dict objectForKey:kGoodsDetilBaseClassListComment];
    NSMutableArray *parsedGoodsDetilListComment = [NSMutableArray array];
    
    if ([receivedGoodsDetilListComment isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGoodsDetilListComment) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGoodsDetilListComment addObject:[GoodsDetilListComment modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGoodsDetilListComment isKindOfClass:[NSDictionary class]]) {
       [parsedGoodsDetilListComment addObject:[GoodsDetilListComment modelObjectWithDictionary:(NSDictionary *)receivedGoodsDetilListComment]];
    }

    self.listComment = [NSArray arrayWithArray:parsedGoodsDetilListComment];
            self.code = [self objectOrNilForKey:kGoodsDetilBaseClassCode fromDictionary:dict];
            self.comm = [GoodsDetilComm modelObjectWithDictionary:[dict objectForKey:kGoodsDetilBaseClassComm]];
            self.msg = [self objectOrNilForKey:kGoodsDetilBaseClassMsg fromDictionary:dict];
            self.listPic = [self objectOrNilForKey:kGoodsDetilBaseClassListPic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgSrc forKey:kGoodsDetilBaseClassImgSrc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kGoodsDetilBaseClassTotalCount];
    NSMutableArray *tempArrayForListComment = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.listComment) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListComment addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListComment addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListComment] forKey:kGoodsDetilBaseClassListComment];
    [mutableDict setValue:self.code forKey:kGoodsDetilBaseClassCode];
    [mutableDict setValue:[self.comm dictionaryRepresentation] forKey:kGoodsDetilBaseClassComm];
    [mutableDict setValue:self.msg forKey:kGoodsDetilBaseClassMsg];
    NSMutableArray *tempArrayForListPic = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.listPic) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListPic addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListPic addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListPic] forKey:kGoodsDetilBaseClassListPic];

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

    self.imgSrc = [aDecoder decodeObjectForKey:kGoodsDetilBaseClassImgSrc];
    self.totalCount = [aDecoder decodeDoubleForKey:kGoodsDetilBaseClassTotalCount];
    self.listComment = [aDecoder decodeObjectForKey:kGoodsDetilBaseClassListComment];
    self.code = [aDecoder decodeObjectForKey:kGoodsDetilBaseClassCode];
    self.comm = [aDecoder decodeObjectForKey:kGoodsDetilBaseClassComm];
    self.msg = [aDecoder decodeObjectForKey:kGoodsDetilBaseClassMsg];
    self.listPic = [aDecoder decodeObjectForKey:kGoodsDetilBaseClassListPic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgSrc forKey:kGoodsDetilBaseClassImgSrc];
    [aCoder encodeDouble:_totalCount forKey:kGoodsDetilBaseClassTotalCount];
    [aCoder encodeObject:_listComment forKey:kGoodsDetilBaseClassListComment];
    [aCoder encodeObject:_code forKey:kGoodsDetilBaseClassCode];
    [aCoder encodeObject:_comm forKey:kGoodsDetilBaseClassComm];
    [aCoder encodeObject:_msg forKey:kGoodsDetilBaseClassMsg];
    [aCoder encodeObject:_listPic forKey:kGoodsDetilBaseClassListPic];
}

- (id)copyWithZone:(NSZone *)zone {
    GoodsDetilBaseClass *copy = [[GoodsDetilBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.totalCount = self.totalCount;
        copy.listComment = [self.listComment copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.comm = [self.comm copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.listPic = [self.listPic copyWithZone:zone];
    }
    
    return copy;
}


@end
