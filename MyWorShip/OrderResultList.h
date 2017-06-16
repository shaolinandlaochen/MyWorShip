//
//  OrderResultList.h
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OrderResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double orderSerial;
@property (nonatomic, assign) double orderAmount;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *equipmentAddress;
@property (nonatomic, assign) double orderState;
@property (nonatomic, assign) double commodityId;
@property (nonatomic, strong) NSString *orderTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
