//
//  GoodsDetilComm.h
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetilComm : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commodityIscoupon;
@property (nonatomic, assign) double commodityWeight;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, assign) double commoditySales;
@property (nonatomic, assign) double commodityDiscount;
@property (nonatomic, strong) NSString *commodityIndexImage1;
@property (nonatomic, assign) double commodityMarketprice;
@property (nonatomic, assign) double commodityVipSellprice;
@property (nonatomic, assign) double commodityGrade;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, assign) double commIdentifier;
@property (nonatomic, strong) NSString *commodityProarea;
@property (nonatomic, strong) NSString *commodityImages;
@property (nonatomic, strong) NSString *commodityManufacturer;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, assign) double commodityReserves;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double commodityLookcount;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *commodityDesc;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
