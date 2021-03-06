//
//  BasicInformationBaseClass.h
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BasicInformationInfo;

@interface BasicInformationBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double nomessageread;
@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) BasicInformationInfo *info;
@property (nonatomic, assign) double remain;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
