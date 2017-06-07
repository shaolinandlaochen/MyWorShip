//
//  BasicInformationInfo.h
//
//  Created by   on 2017/6/7
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BasicInformationInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double infoIdentifier;
@property (nonatomic, assign) double baseIsSex;
@property (nonatomic, strong) NSString *basePhone;
@property (nonatomic, assign) double baseState;
@property (nonatomic, strong) NSString *baseRegisterTime;
@property (nonatomic, assign) id baseLastloginIp;
@property (nonatomic, assign) double baseIsPerioddate;
@property (nonatomic, assign) double baseUuid;
@property (nonatomic, assign) id basePeriodDate;
@property (nonatomic, assign) id baseSex;
@property (nonatomic, strong) NSString *baseCountry;
@property (nonatomic, assign) double baseVisitCount;
@property (nonatomic, assign) id baseNickname;
@property (nonatomic, assign) id baseLastloginTime;
@property (nonatomic, assign) double baseIsNickname;
@property (nonatomic, assign) double baseIsVip;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
