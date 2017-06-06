//
//  Top_up_detailResultList.h
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Top_up_detailResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double rechargeType;
@property (nonatomic, strong) NSString *rechargeDescribe;
@property (nonatomic, assign) id remark;
@property (nonatomic, assign) double rechargeState;
@property (nonatomic, strong) NSString *rechargeSerial;
@property (nonatomic, assign) double baseUuid;
@property (nonatomic, assign) double rechargeAmount;
@property (nonatomic, strong) NSString *rechargeTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
