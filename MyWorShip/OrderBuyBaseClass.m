//
//  OrderBuyBaseClass.m
//
//  Created by   on 2017/6/23
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderBuyBaseClass.h"


NSString *const kOrderBuyBaseClassCode = @"code";
NSString *const kOrderBuyBaseClassImgSrc = @"imgSrc";
NSString *const kOrderBuyBaseClassMsg = @"msg";
NSString *const kOrderBuyBaseClassSerial = @"serial";


@interface OrderBuyBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderBuyBaseClass

@synthesize code = _code;
@synthesize imgSrc = _imgSrc;
@synthesize msg = _msg;
@synthesize serial = _serial;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kOrderBuyBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kOrderBuyBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kOrderBuyBaseClassMsg fromDictionary:dict];
            self.serial = [self objectOrNilForKey:kOrderBuyBaseClassSerial fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kOrderBuyBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kOrderBuyBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kOrderBuyBaseClassMsg];
    [mutableDict setValue:self.serial forKey:kOrderBuyBaseClassSerial];

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

    self.code = [aDecoder decodeObjectForKey:kOrderBuyBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kOrderBuyBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kOrderBuyBaseClassMsg];
    self.serial = [aDecoder decodeObjectForKey:kOrderBuyBaseClassSerial];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kOrderBuyBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kOrderBuyBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kOrderBuyBaseClassMsg];
    [aCoder encodeObject:_serial forKey:kOrderBuyBaseClassSerial];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderBuyBaseClass *copy = [[OrderBuyBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.serial = [self.serial copyWithZone:zone];
    }
    
    return copy;
}


@end
