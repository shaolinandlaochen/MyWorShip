//
//  NearTheEquipmentEquipmentall.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NearTheEquipmentEquipmentall : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *equipmentAddress;
@property (nonatomic, assign) double equipmentState;
@property (nonatomic, assign) double equipmentUuid;
@property (nonatomic, strong) NSString *equipmentLatitude;
@property (nonatomic, strong) NSString *equipmentName;
@property (nonatomic, strong) NSString *equipmentLongitude;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
