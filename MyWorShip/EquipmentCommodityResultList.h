//
//  EquipmentCommodityResultList.h
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface EquipmentCommodityResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commodityReserves;
@property (nonatomic, assign) double equipmentUuid;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, assign) double commodityVipSellprice;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, assign) double commodityIsfree;
@property (nonatomic, assign) double commoditySales;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
