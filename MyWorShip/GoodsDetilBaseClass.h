//
//  GoodsDetilBaseClass.h
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GoodsDetilComm;

@interface GoodsDetilBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, assign) double totalCount;
@property (nonatomic, strong) NSArray *listComment;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) GoodsDetilComm *comm;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSArray *listPic;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
