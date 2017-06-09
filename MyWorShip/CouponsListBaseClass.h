//
//  CouponsListBaseClass.h
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CouponsListPagingList;

@interface CouponsListBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) CouponsListPagingList *pagingList;
@property (nonatomic, strong) NSString *code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
