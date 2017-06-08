//
//  AnnouncementListBaseClass.m
//
//  Created by   on 2017/6/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AnnouncementListBaseClass.h"
#import "AnnouncementListData.h"


NSString *const kAnnouncementListBaseClassMsg = @"msg";
NSString *const kAnnouncementListBaseClassData = @"data";
NSString *const kAnnouncementListBaseClassCode = @"code";


@interface AnnouncementListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AnnouncementListBaseClass

@synthesize msg = _msg;
@synthesize data = _data;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kAnnouncementListBaseClassMsg fromDictionary:dict];
            self.data = [AnnouncementListData modelObjectWithDictionary:[dict objectForKey:kAnnouncementListBaseClassData]];
            self.code = [self objectOrNilForKey:kAnnouncementListBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kAnnouncementListBaseClassMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kAnnouncementListBaseClassData];
    [mutableDict setValue:self.code forKey:kAnnouncementListBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kAnnouncementListBaseClassMsg];
    self.data = [aDecoder decodeObjectForKey:kAnnouncementListBaseClassData];
    self.code = [aDecoder decodeObjectForKey:kAnnouncementListBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kAnnouncementListBaseClassMsg];
    [aCoder encodeObject:_data forKey:kAnnouncementListBaseClassData];
    [aCoder encodeObject:_code forKey:kAnnouncementListBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    AnnouncementListBaseClass *copy = [[AnnouncementListBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
