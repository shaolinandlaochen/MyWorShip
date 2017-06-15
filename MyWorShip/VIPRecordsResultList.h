//
//  VIPRecordsResultList.h
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VIPRecordsResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *vipTime;
@property (nonatomic, assign) double vipRemain;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
