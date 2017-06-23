//
//  CouponList.h
//
//  Created by   on 2017/6/23
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CouponList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double couponType;
@property (nonatomic, assign) double couponGrantTime;
@property (nonatomic, strong) NSString *couponName;
@property (nonatomic, assign) double couponListIdentifier;
@property (nonatomic, assign) double couponState;
@property (nonatomic, assign) double couponFullAmount;
@property (nonatomic, assign) double couponSubtractAmount;
@property (nonatomic, assign) id couponUseTime;
@property (nonatomic, assign) double couponExpireTime;
@property (nonatomic, assign) double couponDiscount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
