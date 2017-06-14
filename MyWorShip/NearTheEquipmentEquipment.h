//
//  NearTheEquipmentEquipment.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NearTheEquipmentEquipment : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *equipmentLongitude;
@property (nonatomic, assign) double equipmentState;
@property (nonatomic, strong) NSString *equipmentAddress;
@property (nonatomic, strong) NSString *equipmentLatitude;
@property (nonatomic, strong) NSString *equipmentName;
@property (nonatomic, assign) double equipmentUuid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
