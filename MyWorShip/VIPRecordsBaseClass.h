//
//  VIPRecordsBaseClass.h
//
//  Created by   on 2017/6/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VIPRecordsPagingList;

@interface VIPRecordsBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) VIPRecordsPagingList *pagingList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
