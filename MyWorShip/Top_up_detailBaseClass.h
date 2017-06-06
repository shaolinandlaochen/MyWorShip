//
//  Top_up_detailBaseClass.h
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Top_up_detailPagingList;

@interface Top_up_detailBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *endProperty;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) Top_up_detailPagingList *pagingList;
@property (nonatomic, strong) NSString *start;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
