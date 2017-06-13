//
//  EvaluationListResultList.m
//
//  Created by   on 2017/6/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "EvaluationListResultList.h"


NSString *const kEvaluationListResultListBaseNickname = @"base_nickname";
NSString *const kEvaluationListResultListCommoditySerial = @"commodity_serial";
NSString *const kEvaluationListResultListId = @"id";
NSString *const kEvaluationListResultListOrderSerial = @"order_serial";
NSString *const kEvaluationListResultListBaseIsVip = @"base_is_vip";
NSString *const kEvaluationListResultListCommentContent = @"comment_content";
NSString *const kEvaluationListResultListCommentGrade = @"comment_grade";
NSString *const kEvaluationListResultListCommentReply = @"comment_reply";
NSString *const kEvaluationListResultListCommentTime = @"comment_time";
NSString *const kEvaluationListResultListCommentReplyTime = @"comment_reply_time";


@interface EvaluationListResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EvaluationListResultList

@synthesize baseNickname = _baseNickname;
@synthesize commoditySerial = _commoditySerial;
@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize orderSerial = _orderSerial;
@synthesize baseIsVip = _baseIsVip;
@synthesize commentContent = _commentContent;
@synthesize commentGrade = _commentGrade;
@synthesize commentReply = _commentReply;
@synthesize commentTime = _commentTime;
@synthesize commentReplyTime = _commentReplyTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.baseNickname = [self objectOrNilForKey:kEvaluationListResultListBaseNickname fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kEvaluationListResultListCommoditySerial fromDictionary:dict] doubleValue];
            self.resultListIdentifier = [[self objectOrNilForKey:kEvaluationListResultListId fromDictionary:dict] doubleValue];
            self.orderSerial = [[self objectOrNilForKey:kEvaluationListResultListOrderSerial fromDictionary:dict] doubleValue];
            self.baseIsVip = [[self objectOrNilForKey:kEvaluationListResultListBaseIsVip fromDictionary:dict] doubleValue];
            self.commentContent = [self objectOrNilForKey:kEvaluationListResultListCommentContent fromDictionary:dict];
            self.commentGrade = [[self objectOrNilForKey:kEvaluationListResultListCommentGrade fromDictionary:dict] doubleValue];
            self.commentReply = [self objectOrNilForKey:kEvaluationListResultListCommentReply fromDictionary:dict];
            self.commentTime = [self objectOrNilForKey:kEvaluationListResultListCommentTime fromDictionary:dict];
            self.commentReplyTime = [self objectOrNilForKey:kEvaluationListResultListCommentReplyTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.baseNickname forKey:kEvaluationListResultListBaseNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kEvaluationListResultListCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kEvaluationListResultListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderSerial] forKey:kEvaluationListResultListOrderSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseIsVip] forKey:kEvaluationListResultListBaseIsVip];
    [mutableDict setValue:self.commentContent forKey:kEvaluationListResultListCommentContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentGrade] forKey:kEvaluationListResultListCommentGrade];
    [mutableDict setValue:self.commentReply forKey:kEvaluationListResultListCommentReply];
    [mutableDict setValue:self.commentTime forKey:kEvaluationListResultListCommentTime];
    [mutableDict setValue:self.commentReplyTime forKey:kEvaluationListResultListCommentReplyTime];

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

    self.baseNickname = [aDecoder decodeObjectForKey:kEvaluationListResultListBaseNickname];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kEvaluationListResultListCommoditySerial];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kEvaluationListResultListId];
    self.orderSerial = [aDecoder decodeDoubleForKey:kEvaluationListResultListOrderSerial];
    self.baseIsVip = [aDecoder decodeDoubleForKey:kEvaluationListResultListBaseIsVip];
    self.commentContent = [aDecoder decodeObjectForKey:kEvaluationListResultListCommentContent];
    self.commentGrade = [aDecoder decodeDoubleForKey:kEvaluationListResultListCommentGrade];
    self.commentReply = [aDecoder decodeObjectForKey:kEvaluationListResultListCommentReply];
    self.commentTime = [aDecoder decodeObjectForKey:kEvaluationListResultListCommentTime];
    self.commentReplyTime = [aDecoder decodeObjectForKey:kEvaluationListResultListCommentReplyTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_baseNickname forKey:kEvaluationListResultListBaseNickname];
    [aCoder encodeDouble:_commoditySerial forKey:kEvaluationListResultListCommoditySerial];
    [aCoder encodeDouble:_resultListIdentifier forKey:kEvaluationListResultListId];
    [aCoder encodeDouble:_orderSerial forKey:kEvaluationListResultListOrderSerial];
    [aCoder encodeDouble:_baseIsVip forKey:kEvaluationListResultListBaseIsVip];
    [aCoder encodeObject:_commentContent forKey:kEvaluationListResultListCommentContent];
    [aCoder encodeDouble:_commentGrade forKey:kEvaluationListResultListCommentGrade];
    [aCoder encodeObject:_commentReply forKey:kEvaluationListResultListCommentReply];
    [aCoder encodeObject:_commentTime forKey:kEvaluationListResultListCommentTime];
    [aCoder encodeObject:_commentReplyTime forKey:kEvaluationListResultListCommentReplyTime];
}

- (id)copyWithZone:(NSZone *)zone {
    EvaluationListResultList *copy = [[EvaluationListResultList alloc] init];
    
    
    
    if (copy) {

        copy.baseNickname = [self.baseNickname copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.resultListIdentifier = self.resultListIdentifier;
        copy.orderSerial = self.orderSerial;
        copy.baseIsVip = self.baseIsVip;
        copy.commentContent = [self.commentContent copyWithZone:zone];
        copy.commentGrade = self.commentGrade;
        copy.commentReply = [self.commentReply copyWithZone:zone];
        copy.commentTime = [self.commentTime copyWithZone:zone];
        copy.commentReplyTime = [self.commentReplyTime copyWithZone:zone];
    }
    
    return copy;
}


@end
