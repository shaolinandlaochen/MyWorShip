//
//  BasicInformationBaseClass.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BasicInformationBaseClass.h"
#import "BasicInformationInfo.h"


NSString *const kBasicInformationBaseClassNomessageread = @"nomessageread";
NSString *const kBasicInformationBaseClassImgSrc = @"imgSrc";
NSString *const kBasicInformationBaseClassCode = @"code";
NSString *const kBasicInformationBaseClassMsg = @"msg";
NSString *const kBasicInformationBaseClassInfo = @"info";
NSString *const kBasicInformationBaseClassRemain = @"remain";


@interface BasicInformationBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BasicInformationBaseClass

@synthesize nomessageread = _nomessageread;
@synthesize imgSrc = _imgSrc;
@synthesize code = _code;
@synthesize msg = _msg;
@synthesize info = _info;
@synthesize remain = _remain;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.nomessageread = [[self objectOrNilForKey:kBasicInformationBaseClassNomessageread fromDictionary:dict] doubleValue];
            self.imgSrc = [self objectOrNilForKey:kBasicInformationBaseClassImgSrc fromDictionary:dict];
            self.code = [self objectOrNilForKey:kBasicInformationBaseClassCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kBasicInformationBaseClassMsg fromDictionary:dict];
            self.info = [BasicInformationInfo modelObjectWithDictionary:[dict objectForKey:kBasicInformationBaseClassInfo]];
            self.remain = [[self objectOrNilForKey:kBasicInformationBaseClassRemain fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nomessageread] forKey:kBasicInformationBaseClassNomessageread];
    [mutableDict setValue:self.imgSrc forKey:kBasicInformationBaseClassImgSrc];
    [mutableDict setValue:self.code forKey:kBasicInformationBaseClassCode];
    [mutableDict setValue:self.msg forKey:kBasicInformationBaseClassMsg];
    [mutableDict setValue:[self.info dictionaryRepresentation] forKey:kBasicInformationBaseClassInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.remain] forKey:kBasicInformationBaseClassRemain];

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

    self.nomessageread = [aDecoder decodeDoubleForKey:kBasicInformationBaseClassNomessageread];
    self.imgSrc = [aDecoder decodeObjectForKey:kBasicInformationBaseClassImgSrc];
    self.code = [aDecoder decodeObjectForKey:kBasicInformationBaseClassCode];
    self.msg = [aDecoder decodeObjectForKey:kBasicInformationBaseClassMsg];
    self.info = [aDecoder decodeObjectForKey:kBasicInformationBaseClassInfo];
    self.remain = [aDecoder decodeDoubleForKey:kBasicInformationBaseClassRemain];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_nomessageread forKey:kBasicInformationBaseClassNomessageread];
    [aCoder encodeObject:_imgSrc forKey:kBasicInformationBaseClassImgSrc];
    [aCoder encodeObject:_code forKey:kBasicInformationBaseClassCode];
    [aCoder encodeObject:_msg forKey:kBasicInformationBaseClassMsg];
    [aCoder encodeObject:_info forKey:kBasicInformationBaseClassInfo];
    [aCoder encodeDouble:_remain forKey:kBasicInformationBaseClassRemain];
}

- (id)copyWithZone:(NSZone *)zone {
    BasicInformationBaseClass *copy = [[BasicInformationBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.nomessageread = self.nomessageread;
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.info = [self.info copyWithZone:zone];
        copy.remain = self.remain;
    }
    
    return copy;
}


@end
