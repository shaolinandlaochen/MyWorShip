//
//  MonthsThanksGoodsResultList.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MonthsThanksGoodsResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commoditySales;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, assign) double commodityDiscount;
@property (nonatomic, assign) double commodityVipSellprice;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, assign) double commodityReserves;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
