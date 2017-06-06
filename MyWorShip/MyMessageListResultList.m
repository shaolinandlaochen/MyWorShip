//
//  MyMessageListResultList.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyMessageListResultList.h"


NSString *const kMyMessageListResultListReadState = @"read_state";
NSString *const kMyMessageListResultListMessageTarget = @"message_target";
NSString *const kMyMessageListResultListDelState = @"del_state";
NSString *const kMyMessageListResultListId = @"id";
NSString *const kMyMessageListResultListMessageCategory = @"message_category";
NSString *const kMyMessageListResultListMessageText = @"message_text";
NSString *const kMyMessageListResultListMessageTime = @"message_time";
NSString *const kMyMessageListResultListMessageTitle = @"message_title";


@interface MyMessageListResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyMessageListResultList

@synthesize readState = _readState;
@synthesize messageTarget = _messageTarget;
@synthesize delState = _delState;
@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize messageCategory = _messageCategory;
@synthesize messageText = _messageText;
@synthesize messageTime = _messageTime;
@synthesize messageTitle = _messageTitle;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.readState = [[self objectOrNilForKey:kMyMessageListResultListReadState fromDictionary:dict] doubleValue];
            self.messageTarget = [[self objectOrNilForKey:kMyMessageListResultListMessageTarget fromDictionary:dict] doubleValue];
            self.delState = [[self objectOrNilForKey:kMyMessageListResultListDelState fromDictionary:dict] doubleValue];
            self.resultListIdentifier = [[self objectOrNilForKey:kMyMessageListResultListId fromDictionary:dict] doubleValue];
            self.messageCategory = [[self objectOrNilForKey:kMyMessageListResultListMessageCategory fromDictionary:dict] doubleValue];
            self.messageText = [self objectOrNilForKey:kMyMessageListResultListMessageText fromDictionary:dict];
            self.messageTime = [self objectOrNilForKey:kMyMessageListResultListMessageTime fromDictionary:dict];
            self.messageTitle = [self objectOrNilForKey:kMyMessageListResultListMessageTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.readState] forKey:kMyMessageListResultListReadState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.messageTarget] forKey:kMyMessageListResultListMessageTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.delState] forKey:kMyMessageListResultListDelState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kMyMessageListResultListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.messageCategory] forKey:kMyMessageListResultListMessageCategory];
    [mutableDict setValue:self.messageText forKey:kMyMessageListResultListMessageText];
    [mutableDict setValue:self.messageTime forKey:kMyMessageListResultListMessageTime];
    [mutableDict setValue:self.messageTitle forKey:kMyMessageListResultListMessageTitle];

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

    self.readState = [aDecoder decodeDoubleForKey:kMyMessageListResultListReadState];
    self.messageTarget = [aDecoder decodeDoubleForKey:kMyMessageListResultListMessageTarget];
    self.delState = [aDecoder decodeDoubleForKey:kMyMessageListResultListDelState];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kMyMessageListResultListId];
    self.messageCategory = [aDecoder decodeDoubleForKey:kMyMessageListResultListMessageCategory];
    self.messageText = [aDecoder decodeObjectForKey:kMyMessageListResultListMessageText];
    self.messageTime = [aDecoder decodeObjectForKey:kMyMessageListResultListMessageTime];
    self.messageTitle = [aDecoder decodeObjectForKey:kMyMessageListResultListMessageTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_readState forKey:kMyMessageListResultListReadState];
    [aCoder encodeDouble:_messageTarget forKey:kMyMessageListResultListMessageTarget];
    [aCoder encodeDouble:_delState forKey:kMyMessageListResultListDelState];
    [aCoder encodeDouble:_resultListIdentifier forKey:kMyMessageListResultListId];
    [aCoder encodeDouble:_messageCategory forKey:kMyMessageListResultListMessageCategory];
    [aCoder encodeObject:_messageText forKey:kMyMessageListResultListMessageText];
    [aCoder encodeObject:_messageTime forKey:kMyMessageListResultListMessageTime];
    [aCoder encodeObject:_messageTitle forKey:kMyMessageListResultListMessageTitle];
}

- (id)copyWithZone:(NSZone *)zone {
    MyMessageListResultList *copy = [[MyMessageListResultList alloc] init];
    
    
    
    if (copy) {

        copy.readState = self.readState;
        copy.messageTarget = self.messageTarget;
        copy.delState = self.delState;
        copy.resultListIdentifier = self.resultListIdentifier;
        copy.messageCategory = self.messageCategory;
        copy.messageText = [self.messageText copyWithZone:zone];
        copy.messageTime = [self.messageTime copyWithZone:zone];
        copy.messageTitle = [self.messageTitle copyWithZone:zone];
    }
    
    return copy;
}


@end
