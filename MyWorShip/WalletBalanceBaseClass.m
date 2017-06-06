//
//  WalletBalanceBaseClass.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "WalletBalanceBaseClass.h"


NSString *const kWalletBalanceBaseClassCremain = @"cremain";
NSString *const kWalletBalanceBaseClassMsg = @"msg";
NSString *const kWalletBalanceBaseClassCode = @"code";


@interface WalletBalanceBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WalletBalanceBaseClass

@synthesize cremain = _cremain;
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
            self.cremain = [[self objectOrNilForKey:kWalletBalanceBaseClassCremain fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kWalletBalanceBaseClassMsg fromDictionary:dict];
            self.code = [self objectOrNilForKey:kWalletBalanceBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cremain] forKey:kWalletBalanceBaseClassCremain];
    [mutableDict setValue:self.msg forKey:kWalletBalanceBaseClassMsg];
    [mutableDict setValue:self.code forKey:kWalletBalanceBaseClassCode];

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

    self.cremain = [aDecoder decodeDoubleForKey:kWalletBalanceBaseClassCremain];
    self.msg = [aDecoder decodeObjectForKey:kWalletBalanceBaseClassMsg];
    self.code = [aDecoder decodeObjectForKey:kWalletBalanceBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cremain forKey:kWalletBalanceBaseClassCremain];
    [aCoder encodeObject:_msg forKey:kWalletBalanceBaseClassMsg];
    [aCoder encodeObject:_code forKey:kWalletBalanceBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    WalletBalanceBaseClass *copy = [[WalletBalanceBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.cremain = self.cremain;
        copy.msg = [self.msg copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
