//
//  EvaluationListResultList.h
//
//  Created by   on 2017/6/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface EvaluationListResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *baseNickname;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, assign) double orderSerial;
@property (nonatomic, assign) double baseIsVip;
@property (nonatomic, strong) NSString *commentContent;
@property (nonatomic, assign) double commentGrade;
@property (nonatomic, strong) NSString *commentReply;
@property (nonatomic, strong) NSString *commentTime;
@property (nonatomic, strong) NSString *commentReplyTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
