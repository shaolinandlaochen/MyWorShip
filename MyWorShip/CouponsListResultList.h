//
//  CouponsListResultList.h
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CouponsListResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double couponDiscount;
@property (nonatomic, strong) NSString *couponGrantTime;
@property (nonatomic, strong) NSString *couponName;
@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, assign) double couponState;
@property (nonatomic, assign) double couponFullAmount;
@property (nonatomic, assign) double couponSubtractAmount;
@property (nonatomic, assign) double baseUuid;
@property (nonatomic, assign) id couponUseTime;
@property (nonatomic, assign) double couponType;
@property (nonatomic, strong) NSString *couponExpireTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
