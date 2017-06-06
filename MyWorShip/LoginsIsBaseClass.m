//
//  LoginsIsBaseClass.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LoginsIsBaseClass.h"


NSString *const kLoginsIsBaseClassToken = @"token";
NSString *const kLoginsIsBaseClassMsg = @"msg";
NSString *const kLoginsIsBaseClassCode = @"code";


@interface LoginsIsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginsIsBaseClass

@synthesize token = _token;
@synthesize msg = _msg;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.token = [self objectOrNilForKey:kLoginsIsBaseClassToken fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kLoginsIsBaseClassMsg fromDictionary:dict];
            self.code = [self objectOrNilForKey:kLoginsIsBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.token forKey:kLoginsIsBaseClassToken];
    [mutableDict setValue:self.msg forKey:kLoginsIsBaseClassMsg];
    [mutableDict setValue:self.code forKey:kLoginsIsBaseClassCode];

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

    self.token = [aDecoder decodeObjectForKey:kLoginsIsBaseClassToken];
    self.msg = [aDecoder decodeObjectForKey:kLoginsIsBaseClassMsg];
    self.code = [aDecoder decodeObjectForKey:kLoginsIsBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_token forKey:kLoginsIsBaseClassToken];
    [aCoder encodeObject:_msg forKey:kLoginsIsBaseClassMsg];
    [aCoder encodeObject:_code forKey:kLoginsIsBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    LoginsIsBaseClass *copy = [[LoginsIsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.token = [self.token copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
