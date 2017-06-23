//
//  PayForResultsBaseClass.m
//
//  Created by   on 2017/6/23
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "PayForResultsBaseClass.h"


NSString *const kPayForResultsBaseClassMsg = @"msg";
NSString *const kPayForResultsBaseClassCode = @"code";


@interface PayForResultsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayForResultsBaseClass

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
            self.msg = [self objectOrNilForKey:kPayForResultsBaseClassMsg fromDictionary:dict];
            self.code = [self objectOrNilForKey:kPayForResultsBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kPayForResultsBaseClassMsg];
    [mutableDict setValue:self.code forKey:kPayForResultsBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kPayForResultsBaseClassMsg];
    self.code = [aDecoder decodeObjectForKey:kPayForResultsBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kPayForResultsBaseClassMsg];
    [aCoder encodeObject:_code forKey:kPayForResultsBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    PayForResultsBaseClass *copy = [[PayForResultsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
