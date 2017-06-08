//
//  AnnouncementListResultList.m
//
//  Created by   on 2017/6/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AnnouncementListResultList.h"


NSString *const kAnnouncementListResultListNoticeTime = @"notice_time";
NSString *const kAnnouncementListResultListId = @"id";
NSString *const kAnnouncementListResultListNoticeIstop = @"notice_istop";
NSString *const kAnnouncementListResultListNoticeTitle = @"notice_title";
NSString *const kAnnouncementListResultListNoticeContent = @"notice_content";


@interface AnnouncementListResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AnnouncementListResultList

@synthesize noticeTime = _noticeTime;
@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize noticeIstop = _noticeIstop;
@synthesize noticeTitle = _noticeTitle;
@synthesize noticeContent = _noticeContent;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.noticeTime = [self objectOrNilForKey:kAnnouncementListResultListNoticeTime fromDictionary:dict];
            self.resultListIdentifier = [[self objectOrNilForKey:kAnnouncementListResultListId fromDictionary:dict] doubleValue];
            self.noticeIstop = [[self objectOrNilForKey:kAnnouncementListResultListNoticeIstop fromDictionary:dict] doubleValue];
            self.noticeTitle = [self objectOrNilForKey:kAnnouncementListResultListNoticeTitle fromDictionary:dict];
            self.noticeContent = [self objectOrNilForKey:kAnnouncementListResultListNoticeContent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.noticeTime forKey:kAnnouncementListResultListNoticeTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kAnnouncementListResultListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.noticeIstop] forKey:kAnnouncementListResultListNoticeIstop];
    [mutableDict setValue:self.noticeTitle forKey:kAnnouncementListResultListNoticeTitle];
    [mutableDict setValue:self.noticeContent forKey:kAnnouncementListResultListNoticeContent];

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

    self.noticeTime = [aDecoder decodeObjectForKey:kAnnouncementListResultListNoticeTime];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kAnnouncementListResultListId];
    self.noticeIstop = [aDecoder decodeDoubleForKey:kAnnouncementListResultListNoticeIstop];
    self.noticeTitle = [aDecoder decodeObjectForKey:kAnnouncementListResultListNoticeTitle];
    self.noticeContent = [aDecoder decodeObjectForKey:kAnnouncementListResultListNoticeContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_noticeTime forKey:kAnnouncementListResultListNoticeTime];
    [aCoder encodeDouble:_resultListIdentifier forKey:kAnnouncementListResultListId];
    [aCoder encodeDouble:_noticeIstop forKey:kAnnouncementListResultListNoticeIstop];
    [aCoder encodeObject:_noticeTitle forKey:kAnnouncementListResultListNoticeTitle];
    [aCoder encodeObject:_noticeContent forKey:kAnnouncementListResultListNoticeContent];
}

- (id)copyWithZone:(NSZone *)zone {
    AnnouncementListResultList *copy = [[AnnouncementListResultList alloc] init];
    
    
    
    if (copy) {

        copy.noticeTime = [self.noticeTime copyWithZone:zone];
        copy.resultListIdentifier = self.resultListIdentifier;
        copy.noticeIstop = self.noticeIstop;
        copy.noticeTitle = [self.noticeTitle copyWithZone:zone];
        copy.noticeContent = [self.noticeContent copyWithZone:zone];
    }
    
    return copy;
}


@end
