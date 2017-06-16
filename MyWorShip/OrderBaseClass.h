//
//  OrderBaseClass.h
//
//  Created by   on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrderPagingList;

@interface OrderBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) OrderPagingList *pagingList;
@property (nonatomic, strong) NSString *code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
