//
//  BasicInformationBaseClass.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BasicInformationBaseClass.h"
#import "BasicInformationInfo.h"


NSString *const kBasicInformationBaseClassCode = @"code";
NSString *const kBasicInformationBaseClassImgSrc = @"imgSrc";
NSString *const kBasicInformationBaseClassInfo = @"info";
NSString *const kBasicInformationBaseClassMsg = @"msg";


@interface BasicInformationBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BasicInformationBaseClass

@synthesize code = _code;
@synthesize imgSrc = _imgSrc;
@synthesize info = _info;
@synthesize msg = _msg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kBasicInformationBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kBasicInformationBaseClassImgSrc fromDictionary:dict];
            self.info = [BasicInformationInfo modelObjectWithDictionary:[dict objectForKey:kBasicInformationBaseClassInfo]];
            self.msg = [self objectOrNilForKey:kBasicInformationBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kBasicInformationBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kBasicInformationBaseClassImgSrc];
    [mutableDict setValue:[self.info dictionaryRepresentation] forKey:kBasicInformationBaseClassInfo];
    [mutableDict setValue:self.msg forKey:kBasicInformationBaseClassMsg];

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

    self.code = [aDecoder decodeObjectForKey:kBasicInformationBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kBasicInformationBaseClassImgSrc];
    self.info = [aDecoder decodeObjectForKey:kBasicInformationBaseClassInfo];
    self.msg = [aDecoder decodeObjectForKey:kBasicInformationBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kBasicInformationBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kBasicInformationBaseClassImgSrc];
    [aCoder encodeObject:_info forKey:kBasicInformationBaseClassInfo];
    [aCoder encodeObject:_msg forKey:kBasicInformationBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    BasicInformationBaseClass *copy = [[BasicInformationBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.info = [self.info copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
