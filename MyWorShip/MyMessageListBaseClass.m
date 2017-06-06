//
//  MyMessageListBaseClass.m
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyMessageListBaseClass.h"
#import "MyMessageListData.h"


NSString *const kMyMessageListBaseClassMsg = @"msg";
NSString *const kMyMessageListBaseClassData = @"data";
NSString *const kMyMessageListBaseClassCode = @"code";


@interface MyMessageListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyMessageListBaseClass

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
            self.msg = [self objectOrNilForKey:kMyMessageListBaseClassMsg fromDictionary:dict];
            self.data = [MyMessageListData modelObjectWithDictionary:[dict objectForKey:kMyMessageListBaseClassData]];
            self.code = [self objectOrNilForKey:kMyMessageListBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kMyMessageListBaseClassMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kMyMessageListBaseClassData];
    [mutableDict setValue:self.code forKey:kMyMessageListBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kMyMessageListBaseClassMsg];
    self.data = [aDecoder decodeObjectForKey:kMyMessageListBaseClassData];
    self.code = [aDecoder decodeObjectForKey:kMyMessageListBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kMyMessageListBaseClassMsg];
    [aCoder encodeObject:_data forKey:kMyMessageListBaseClassData];
    [aCoder encodeObject:_code forKey:kMyMessageListBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    MyMessageListBaseClass *copy = [[MyMessageListBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
