//
//  CodeIsBaseClass.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CodeIsBaseClass.h"


NSString *const kCodeIsBaseClassMsg = @"msg";
NSString *const kCodeIsBaseClassTime = @"time";
NSString *const kCodeIsBaseClassCode = @"code";


@interface CodeIsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CodeIsBaseClass

@synthesize msg = _msg;
@synthesize time = _time;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kCodeIsBaseClassMsg fromDictionary:dict];
            self.time = [[self objectOrNilForKey:kCodeIsBaseClassTime fromDictionary:dict] doubleValue];
            self.code = [self objectOrNilForKey:kCodeIsBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kCodeIsBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kCodeIsBaseClassTime];
    [mutableDict setValue:self.code forKey:kCodeIsBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kCodeIsBaseClassMsg];
    self.time = [aDecoder decodeDoubleForKey:kCodeIsBaseClassTime];
    self.code = [aDecoder decodeObjectForKey:kCodeIsBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kCodeIsBaseClassMsg];
    [aCoder encodeDouble:_time forKey:kCodeIsBaseClassTime];
    [aCoder encodeObject:_code forKey:kCodeIsBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    CodeIsBaseClass *copy = [[CodeIsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.time = self.time;
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
