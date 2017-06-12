//
//  EvaluationListBaseClass.h
//
//  Created by   on 2017/6/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EvaluationListListComment;

@interface EvaluationListBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) EvaluationListListComment *listComment;
@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double totalCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
