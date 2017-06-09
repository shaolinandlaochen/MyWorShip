//
//  GoodsDetilListComment.m
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetilListComment.h"


NSString *const kGoodsDetilListCommentBaseNickname = @"base_nickname";
NSString *const kGoodsDetilListCommentCommoditySerial = @"commodity_serial";
NSString *const kGoodsDetilListCommentId = @"id";
NSString *const kGoodsDetilListCommentOrderSerial = @"order_serial";
NSString *const kGoodsDetilListCommentCommentReply = @"comment_reply";
NSString *const kGoodsDetilListCommentCommentContent = @"comment_content";
NSString *const kGoodsDetilListCommentCommentGrade = @"comment_grade";
NSString *const kGoodsDetilListCommentCommentTime = @"comment_time";
NSString *const kGoodsDetilListCommentCommentReplyTime = @"comment_reply_time";


@interface GoodsDetilListComment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetilListComment

@synthesize baseNickname = _baseNickname;
@synthesize commoditySerial = _commoditySerial;
@synthesize listCommentIdentifier = _listCommentIdentifier;
@synthesize orderSerial = _orderSerial;
@synthesize commentReply = _commentReply;
@synthesize commentContent = _commentContent;
@synthesize commentGrade = _commentGrade;
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
            self.baseNickname = [self objectOrNilForKey:kGoodsDetilListCommentBaseNickname fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kGoodsDetilListCommentCommoditySerial fromDictionary:dict] doubleValue];
            self.listCommentIdentifier = [[self objectOrNilForKey:kGoodsDetilListCommentId fromDictionary:dict] doubleValue];
            self.orderSerial = [[self objectOrNilForKey:kGoodsDetilListCommentOrderSerial fromDictionary:dict] doubleValue];
            self.commentReply = [self objectOrNilForKey:kGoodsDetilListCommentCommentReply fromDictionary:dict];
            self.commentContent = [self objectOrNilForKey:kGoodsDetilListCommentCommentContent fromDictionary:dict];
            self.commentGrade = [[self objectOrNilForKey:kGoodsDetilListCommentCommentGrade fromDictionary:dict] doubleValue];
            self.commentTime = [self objectOrNilForKey:kGoodsDetilListCommentCommentTime fromDictionary:dict];
            self.commentReplyTime = [self objectOrNilForKey:kGoodsDetilListCommentCommentReplyTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.baseNickname forKey:kGoodsDetilListCommentBaseNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kGoodsDetilListCommentCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listCommentIdentifier] forKey:kGoodsDetilListCommentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderSerial] forKey:kGoodsDetilListCommentOrderSerial];
    [mutableDict setValue:self.commentReply forKey:kGoodsDetilListCommentCommentReply];
    [mutableDict setValue:self.commentContent forKey:kGoodsDetilListCommentCommentContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentGrade] forKey:kGoodsDetilListCommentCommentGrade];
    [mutableDict setValue:self.commentTime forKey:kGoodsDetilListCommentCommentTime];
    [mutableDict setValue:self.commentReplyTime forKey:kGoodsDetilListCommentCommentReplyTime];

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

    self.baseNickname = [aDecoder decodeObjectForKey:kGoodsDetilListCommentBaseNickname];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kGoodsDetilListCommentCommoditySerial];
    self.listCommentIdentifier = [aDecoder decodeDoubleForKey:kGoodsDetilListCommentId];
    self.orderSerial = [aDecoder decodeDoubleForKey:kGoodsDetilListCommentOrderSerial];
    self.commentReply = [aDecoder decodeObjectForKey:kGoodsDetilListCommentCommentReply];
    self.commentContent = [aDecoder decodeObjectForKey:kGoodsDetilListCommentCommentContent];
    self.commentGrade = [aDecoder decodeDoubleForKey:kGoodsDetilListCommentCommentGrade];
    self.commentTime = [aDecoder decodeObjectForKey:kGoodsDetilListCommentCommentTime];
    self.commentReplyTime = [aDecoder decodeObjectForKey:kGoodsDetilListCommentCommentReplyTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_baseNickname forKey:kGoodsDetilListCommentBaseNickname];
    [aCoder encodeDouble:_commoditySerial forKey:kGoodsDetilListCommentCommoditySerial];
    [aCoder encodeDouble:_listCommentIdentifier forKey:kGoodsDetilListCommentId];
    [aCoder encodeDouble:_orderSerial forKey:kGoodsDetilListCommentOrderSerial];
    [aCoder encodeObject:_commentReply forKey:kGoodsDetilListCommentCommentReply];
    [aCoder encodeObject:_commentContent forKey:kGoodsDetilListCommentCommentContent];
    [aCoder encodeDouble:_commentGrade forKey:kGoodsDetilListCommentCommentGrade];
    [aCoder encodeObject:_commentTime forKey:kGoodsDetilListCommentCommentTime];
    [aCoder encodeObject:_commentReplyTime forKey:kGoodsDetilListCommentCommentReplyTime];
}

- (id)copyWithZone:(NSZone *)zone {
    GoodsDetilListComment *copy = [[GoodsDetilListComment alloc] init];
    
    
    
    if (copy) {

        copy.baseNickname = [self.baseNickname copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.listCommentIdentifier = self.listCommentIdentifier;
        copy.orderSerial = self.orderSerial;
        copy.commentReply = [self.commentReply copyWithZone:zone];
        copy.commentContent = [self.commentContent copyWithZone:zone];
        copy.commentGrade = self.commentGrade;
        copy.commentTime = [self.commentTime copyWithZone:zone];
        copy.commentReplyTime = [self.commentReplyTime copyWithZone:zone];
    }
    
    return copy;
}


@end
